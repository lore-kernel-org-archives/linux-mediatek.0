From: Jasper Mattsson <jasu-tmnvWD0sGVAk+I/owrrOrA@public.gmane.org>
Subject: [PATCH 0/3] Fix scpsys on MT6797
Date: Mon, 3 Sep 2018 23:06:25 +0300
Message-ID: <20180903200625.GA6388@xn--njmtys-xxab.info>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Hello,

On MT6797, SCPSYS probe fails due to gaps in the scp_domain_data_mt6797
array. The gaps are due to omitted MFG_* power domains. This could be
solved by rearranging the #defines in dt-bindings, but I'm not sure if
that's allowed as it would break compatibility with existing DTBs.

Audio, VENC, VDEC, and MJC were also missing clocks, which I added.

Additionally, if SCPSYS is started with the power domains initially
disabled (e.g. when booting with kexec), it will hang the system. This
is because all the domains are initially powered on in the order they
are defined in the scp_domain_data array, disregarding any subdomain
dependencies. VENC and VDEC are subdomains of MM, but appear before it
in the array. This makes the system hang. Again, this could be solved by
reordering the #defines, but instead I added the MM clock to the domains
and that fixed things even if the MM domain is not powerd on by SPM.

There *might* be a bug that I did not fix, because I am not sure if it
is a bug at all - MFG_ASYNC does not have any bus protection flags,
but on Android

To properly test this patch, you'll need to apply my previous patch
which fixes some clocks, otherwise the system would not work properly
without clk_ignore_unused. The previous patch shows wrong on Patchwork,
not sure what I messed up (should I re-send?), so here's a link to all
my patches, which should only include this and the clk patch at the time
of writing:

https://patchwork.kernel.org/project/linux-mediatek/list/?submitter=182219


Best regards,
Jasper Mattsson

Jasper Mattsson (3):
  soc: mediatek: Bind missing clocks to scpsys on the MT6797
  soc: mediatek: Allow gaps in SCP PDs
  dts: mediatek: mt6797: Bind audio, mjc, and venc clocks to SCPSYS

 .../bindings/soc/mediatek/scpsys.txt          |  2 +-
 arch/arm64/boot/dts/mediatek/mt6797.dtsi      |  9 +++++---
 drivers/soc/mediatek/mtk-scpsys.c             | 21 ++++++++++++++-----
 3 files changed, 23 insertions(+), 9 deletions(-)

--
2.18.0
