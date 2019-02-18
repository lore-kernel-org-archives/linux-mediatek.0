From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 0/2] x86: turn off wrongly enabled CONFIG_GENERIC_HWEIGHT
Date: Mon, 18 Feb 2019 14:59:29 +0900
Message-ID: <1550469571-25933-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org
Cc: Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Christoph Hellwig <hch@lst.de>, Kalle Valo <kvalo@codeaurora.org>, Felix Fietkau <nbd@nbd.name>
List-Id: linux-mediatek@lists.infradead.org


x86 should not enable CONFIG_GENERIC_HWEIGHT
because lib/hweight.c is not used by x86.

The only user is drivers/net/wireless/mediatek/mt76/mac80211.c

Of course, this driver is wrong since drivers should use the
generic API, hweight8().

After fixing it, x86 does not need to compile lib/hweight.c at all.

The real implementation is located in arch/x86/lib/hweight.S



Masahiro Yamada (2):
  wireless: mt76: call hweight8() instead of __sw_hweight8()
  x86: disable CONFIG_GENERIC_HWEIGHT and remove __HAVE_ARCH_SW_HWEIGHT

 arch/x86/Kconfig                              | 3 ---
 arch/x86/include/asm/arch_hweight.h           | 2 --
 drivers/net/wireless/mediatek/mt76/mac80211.c | 2 +-
 lib/hweight.c                                 | 4 ----
 4 files changed, 1 insertion(+), 10 deletions(-)

-- 
2.7.4
