Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFAC9C433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Feb 2022 04:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qrkDOoIbazOWSE+13+xmfyFu0dh5i7anmU8mQv6etUQ=; b=28dyluCsbswNGG
	pI+eJGKPwkZKH8LqU/kzdtLIkDRl5+83ts5vuI/K/kzvcIX/dUNBNcducpmPOznZvGh5oB/j7GW67
	eTMlBaeE6c+UzmglIZDVETWQr3IlapctwD3uzNvpOhfpjKi8FVne7zzkqzgldRiH47yCq3jIw0V1E
	kxfUgv/PEEYPvCIBO0H8xadFeMSIYK7VRVLSfC9uCEJOQXlZwCR1aULkTAni6xbKOolkvHdhzDF+P
	W5D4nUfCoe+gQx1BMrYd4ecsJmMA5pqb2Jc0Cl1Y1Fb/3R1e39rgWeCyuybk9pypMIvijbobEGWhJ
	VTmxXmT43sk4LfjQnguw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOAmA-008q1e-8i; Sun, 27 Feb 2022 04:03:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOAm7-008q1J-HI
 for linux-mediatek@lists.infradead.org; Sun, 27 Feb 2022 04:03:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0D6A1611F1;
 Sun, 27 Feb 2022 04:03:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDEF7C340E9;
 Sun, 27 Feb 2022 04:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645934590;
 bh=rmTOIdLXnxrduKcao1dMovx6h1XzyescCNxEZG4qyko=;
 h=From:To:Cc:Subject:Date:From;
 b=QZhfRs4jJNiMrrZ+zZ72wx9YJIy/drL3Vkx0IG0KNp7sX9xp/QeehHXHQrBMMiQjH
 9QY1WhEhkFAEx+2a9OyyST62NNhieGM670RIawU7xOE4FbUWxC4gT41WzDWNWICJcr
 eshRupQx2qaxq2Me9ndTmSusZmm0IA6ON0RQl19CE0p7xnhvpxl43gx1CX0+7fiz4B
 3Pb616UGRsU5pwocn5SDV6DVNn9wQbXlhAswvKUMsWOxMn4rHYF7GFyscLh0jUDHET
 LgnV5lvkj0cFKzmYhg7D5tRMDX+Mj101gD1DqJ2ds9DGa2JSo0RMODE/KGEy6cjx0/
 gXDgM25xF45hA==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Cc: "Nancy . Lin" <nancy.lin@mediatek.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Julien STEPHAN <jstephan@baylibre.com>
Subject: [GIT PULL] mediatek drm next for 5.18
Date: Sun, 27 Feb 2022 12:03:03 +0800
Message-Id: <1645934583-2018-1-git-send-email-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220226_200311_699142_07CA56DD 
X-CRM114-Status: UNSURE (   9.30  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Dave & Daniel:

This includes:

1. Transfer display binding document to yaml format.
2. Add mt8195 display device binding.
3. Allow commands to be sent during video mode.
4. Add wait_for_event for crtc disable by cmdq.

Regards,
Chun-Kuang.

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-5.18

for you to fetch changes up to aa2d5f2f168c8b380d4e94a32149cef16ed60efc:

  drm/mediatek: Add wait_for_event for crtc disable by cmdq (2022-02-27 11:19:07 +0800)

----------------------------------------------------------------
Mediatek DRM Next for Linux 5.18

1. Transfer display binding document to yaml format.
2. Add mt8195 display device binding.
3. Allow commands to be sent during video mode.
4. Add wait_for_event for crtc disable by cmdq.

----------------------------------------------------------------
Julien STEPHAN (1):
      drm/mediatek: Allow commands to be sent during video mode

Nancy.Lin (2):
      dt-bindings: display: mediatek: add vdosys1 MERGE property for mt8195
      dt-bindings: display: mediatek: add ethdr definition for mt8195

jason-jh.lin (5):
      dt-bindings: display: mediatek: disp: split each block to individual yaml
      dt-bindings: display: mediatek: dsc: add yaml for mt8195 SoC binding
      dt-bindings: display: mediatek: merge: add additional prop for mt8195
      dt-bindings: display: mediatek: add mt8195 SoC binding for vdosys0
      drm/mediatek: Add wait_for_event for crtc disable by cmdq

 .../bindings/display/mediatek/mediatek,aal.yaml    |  77 ++++++++
 .../bindings/display/mediatek/mediatek,ccorr.yaml  |  76 +++++++
 .../bindings/display/mediatek/mediatek,color.yaml  |  86 ++++++++
 .../bindings/display/mediatek/mediatek,disp.txt    | 219 ---------------------
 .../bindings/display/mediatek/mediatek,dither.yaml |  76 +++++++
 .../bindings/display/mediatek/mediatek,dsc.yaml    |  71 +++++++
 .../bindings/display/mediatek/mediatek,ethdr.yaml  | 147 ++++++++++++++
 .../bindings/display/mediatek/mediatek,gamma.yaml  |  77 ++++++++
 .../bindings/display/mediatek/mediatek,merge.yaml  | 110 +++++++++++
 .../bindings/display/mediatek/mediatek,mutex.yaml  |  83 ++++++++
 .../bindings/display/mediatek/mediatek,od.yaml     |  53 +++++
 .../bindings/display/mediatek/mediatek,ovl-2l.yaml |  88 +++++++++
 .../bindings/display/mediatek/mediatek,ovl.yaml    | 103 ++++++++++
 .../display/mediatek/mediatek,postmask.yaml        |  69 +++++++
 .../bindings/display/mediatek/mediatek,rdma.yaml   | 117 +++++++++++
 .../bindings/display/mediatek/mediatek,split.yaml  |  58 ++++++
 .../bindings/display/mediatek/mediatek,ufoe.yaml   |  61 ++++++
 .../bindings/display/mediatek/mediatek,wdma.yaml   |  86 ++++++++
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |  12 ++
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |  33 +++-
 20 files changed, 1474 insertions(+), 228 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
