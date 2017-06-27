From: CK Hu <ck.hu@mediatek.com>
Subject: [GIT PULL] mediatek drm next for 4.13
Date: Tue, 27 Jun 2017 18:18:58 +0800
Message-ID: <1498558738.15992.9.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1513210889=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Dave Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, Colin Ian King <colin.king@canonical.com>
List-Id: linux-mediatek@lists.infradead.org

--===============1513210889==
Content-Type: multipart/alternative; boundary="=-mHq8fK4tJTIuqFWCd6Cg"

--=-mHq8fK4tJTIuqFWCd6Cg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi, Dave:

This include new color format support and some fixups.
Please kindly let me know if there is any problem.

Regards,
CK

The following changes since commit
6d61e70ccc21606ffb8a0a03bd3aba24f659502b:

  Backmerge tag 'v4.12-rc7' into drm-next (2017-06-27 08:28:30 +1000)

are available in the git repository at:


  https://github.com/ckhu-mediatek/linux.git-tags.git
mediatek-drm-next-4.13

for you to fetch changes up to 5ac5895a84d92bd2b3db490f8ee242ccb4d77e96:

  drm/mediatek: separate color module to fixup error memory reallocation
(2017-06-27 17:34:53 +0800)

----------------------------------------------------------------
Bibby Hsieh (1):
      drm/mediatek: Support UYVY and YUYV format for overlay

Christophe Jaillet (1):
      drm/mediatek: check for memory allocation failure

Colin Ian King (1):
      drm/mediatek: re-phrase DRM_INFO error message

Philipp Zabel (1):
      drm/mediatek: use platform_register_drivers

yt.shen@mediatek.com (1):
      drm/mediatek: separate color module to fixup error memory
reallocation

 drivers/gpu/drm/mediatek/Makefile           |   3 +-
 drivers/gpu/drm/mediatek/mtk_disp_color.c   | 176
++++++++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c     |   7 ++
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |   2 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  80 +------------
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |  33 ++----
 drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_plane.c    |   2 +
 drivers/gpu/drm/mediatek/mtk_dsi.c          |   2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c         |  27 +----
 10 files changed, 205 insertions(+), 128 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_color.c

--=-mHq8fK4tJTIuqFWCd6Cg
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/4.2.2">
</HEAD>
<BODY>
Hi, Dave:<BR>
<BR>
This include new color format support and some fixups.<BR>
Please kindly let me know if there is any problem.<BR>
<BR>
Regards,<BR>
CK<BR>
<BR>
The following changes since commit 6d61e70ccc21606ffb8a0a03bd3aba24f659502b:<BR>
<BR>
&nbsp; Backmerge tag 'v4.12-rc7' into drm-next (2017-06-27 08:28:30 +1000)<BR>
<BR>
are available in the git repository at:<BR>
<BR>
<BR>
&nbsp; https://github.com/ckhu-mediatek/linux.git-tags.git mediatek-drm-next-4.13<BR>
<BR>
for you to fetch changes up to 5ac5895a84d92bd2b3db490f8ee242ccb4d77e96:<BR>
<BR>
&nbsp; drm/mediatek: separate color module to fixup error memory reallocation (2017-06-27 17:34:53 +0800)<BR>
<BR>
----------------------------------------------------------------<BR>
Bibby Hsieh (1):<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm/mediatek: Support UYVY and YUYV format for overlay<BR>
<BR>
Christophe Jaillet (1):<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm/mediatek: check for memory allocation failure<BR>
<BR>
Colin Ian King (1):<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm/mediatek: re-phrase DRM_INFO error message<BR>
<BR>
Philipp Zabel (1):<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm/mediatek: use platform_register_drivers<BR>
<BR>
<A HREF="mailto:yt.shen@mediatek.com">yt.shen@mediatek.com</A> (1):<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm/mediatek: separate color module to fixup error memory reallocation<BR>
<BR>
 drivers/gpu/drm/mediatek/Makefile&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 3 +-<BR>
 drivers/gpu/drm/mediatek/mtk_disp_color.c&nbsp;&nbsp; | 176 ++++++++++++++++++++++++++++<BR>
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 7 ++<BR>
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 +<BR>
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |&nbsp; 80 +------------<BR>
 drivers/gpu/drm/mediatek/mtk_drm_drv.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 33 ++----<BR>
 drivers/gpu/drm/mediatek/mtk_drm_drv.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 1 +<BR>
 drivers/gpu/drm/mediatek/mtk_drm_plane.c&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 +<BR>
 drivers/gpu/drm/mediatek/mtk_dsi.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 +-<BR>
 drivers/gpu/drm/mediatek/mtk_hdmi.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 27 +----<BR>
 10 files changed, 205 insertions(+), 128 deletions(-)<BR>
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_color.c
</BODY>
</HTML>

--=-mHq8fK4tJTIuqFWCd6Cg--

--===============1513210889==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1513210889==--
