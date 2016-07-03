From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: ARM: mediatek: dts 32 bits updates for v4.8
Date: Sun, 3 Jul 2016 08:49:29 +0200
Message-ID: <94a90d0c-f459-296c-4290-739515b4ac5b@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Hi all,

Please take into account the following dts patch for arm 32 bits.

Thanks,
Matthias

---

The following changes since commit 1a695a905c18548062509178b98bc91e67510864:

   Linux 4.7-rc1 (2016-05-29 09:29:24 -0700)

are available in the git repository at:

   https://github.com/mbgg/linux-mediatek.git tags/v4.7-next-dts32

for you to fetch changes up to 6f108172f13c311ce2175fab25fbd50940a3622b:

   ARM: dts: mt2701: add iommu/smi dtsi node for mt2701 (2016-07-03 
08:25:08 +0200)

----------------------------------------------------------------
- Add dtsi parts for iommu support

----------------------------------------------------------------
Honghui Zhang (1):
       ARM: dts: mt2701: add iommu/smi dtsi node for mt2701

  arch/arm/boot/dts/mt2701.dtsi | 50 
+++++++++++++++++++++++++++++++++++++++++++
  1 file changed, 50 insertions(+)
