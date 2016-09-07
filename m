From: Tiffany Lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/4] Add V4L2_PIX_FMT_MT21C format for MT8173 codec driver
Date: Wed, 7 Sep 2016 14:56:39 +0800
Message-ID: <1473231403-14900-1-git-send-email-tiffany.lin@mediatek.com>
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
To: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Pawel Osciak <posciak-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Tiffany Lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

This patch series add Mediatek compressed block format V4L2_PIX_FMT_MT21C, the
decoder driver will decoded bitstream to V4L2_PIX_FMT_MT21C format.

User space applications could use MT8173 MDP driver to convert V4L2_PIX_FMT_MT21C to
V4L2_PIX_FMT_NV12M, V4L2_PIX_FMT_YUV420M and V4L2_PIX_FMT_YVU420.

MDP driver[1] is stand alone driver.

Usage:
MT21C -> MT8173 MDP -> NV12M/YUV420M/YVU420
NV12M/NV21M/YUV420M/YVU420M -> mt8173 Encoder -> H264/VP8
H264/VP8/VP9 -> mtk8173 Decoder -> MT21C

When encode with MT21 source, the pipeline will be:
MT21C -> MDP driver-> NV12M/NV21M/YUV420M/YVU420M -> Encoder -> H264/VP8

When playback, the pipeline will be:
H264/VP8/VP9 -> Decoder driver -> MT21C -> MDP Driver -> DRM

[1]https://patchwork.kernel.org/patch/9305329/

Tiffany Lin (4):
  v4l: add Mediatek compressed video block format
  docs-rst: Add compressed video formats used on MT8173 codec driver
  vcodec: mediatek: Add V4L2_PIX_FMT_MT21C support for v4l2 decoder
  arm64: dts: mediatek: Add Video Decoder for MT8173

 Documentation/media/uapi/v4l/pixfmt-reserved.rst   |    6 +++
 arch/arm64/boot/dts/mediatek/mt8173.dtsi           |   44 ++++++++++++++++++++
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c |    7 +++-
 drivers/media/v4l2-core/v4l2-ioctl.c               |    1 +
 include/uapi/linux/videodev2.h                     |    1 +
 5 files changed, 58 insertions(+), 1 deletion(-)

-- 
1.7.9.5
