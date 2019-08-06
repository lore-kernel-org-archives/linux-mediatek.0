From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] mt7601u: null check the allocation
Date: Tue,  6 Aug 2019 12:35:48 +0000 (UTC)
Message-ID: <20190806123549.7C9BD609CD@smtp.codeaurora.org>
References: <20190724141736.29994-1-navid.emamdoost@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190724141736.29994-1-navid.emamdoost@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
Cc: secalert@redhat.com, Jakub Kicinski <kubakici@wp.pl>, linux-wireless@vger.kernel.org, kjlu@umn.edu, linux-kernel@vger.kernel.org, emamd001@umn.edu, linux-mediatek@lists.infradead.org, smccaman@umn.edu, Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, Navid Emamdoost <navid.emamdoost@gmail.com>
List-Id: linux-mediatek@lists.infradead.org

Navid Emamdoost <navid.emamdoost@gmail.com> wrote:

> devm_kzalloc may fail and return NULL. So the null check is needed.
> 
> Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
> Acked-by: Jakub Kicinski <kubakici@wp.pl>

Patch applied to wireless-drivers-next.git, thanks.

b95c732234fa mt7601u: null check the allocation

-- 
https://patchwork.kernel.org/patch/11057013/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
