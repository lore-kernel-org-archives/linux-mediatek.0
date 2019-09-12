From: Jiaxin Yu <jiaxin.yu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/2] ASoC: mt8183: fix audio playback slowly after playback
 during bootup
Date: Thu, 12 Sep 2019 17:54:54 +0800
Message-ID: <1568282096-13821-1-git-send-email-jiaxin.yu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
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
To: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jiaxin.yu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tzungbi-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, eason.yen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

These two patches fix audio playack slowly after playbakc during bootup.
The patches are based on broonie tree "for-next" branch.

Jiaxin Yu (2):
  ASoC: dt-bingdings: mediatek: mt8183: add a property "medaitek,toprgu"
  ASoC: mt8183: fix audio playback slowly after playback during bootup

 .../bindings/sound/mt8183-afe-pcm.txt         |  2 ++
 sound/soc/mediatek/common/mtk-base-afe.h      |  1 +
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c    | 21 +++++++++++++++++++
 sound/soc/mediatek/mt8183/mt8183-reg.h        |  6 ++++++
 4 files changed, 30 insertions(+)

-- 
2.18.0
