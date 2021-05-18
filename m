Return-Path: <SRS0=DTMy=KN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2153DC433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 May 2021 14:21:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E00FE6112F
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 May 2021 14:21:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E00FE6112F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DARakBHR7xkSxiQiPuxjdJneKGP0TX4V+IyBFil7dxs=; b=NBekrycrVMD3h4z0gsARg/zsVD
	2tEe1Dj8yGKEJqZBMYJPcRPV+A9ih2F9be4W3IVJR+1zUpMr5HN8+V/UnROcXewf2zZh0lWPGznLt
	RlxBPRZ/yvAlWorEoQC1UpAR+CP38wRu7ncdX92CnpiDkVAcTdjZS3Orz9CVWIQMJaO1/jTgoh3OL
	R7FBWjc/hCh8xzql1RUJKTrbfD8gxRixaNCtTRr9uXbkvy9YpMywtMxrkxze4M6VblsIU7r+snkI3
	1fNeN7Bgu9MKmHErI9XeQqCbj+96pkzHdPc10769ejMOpXFhX3Y+/CMkOmxkdnXf2/hWk3K0tBPjo
	RVvN2hsA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lj0bL-0010TH-EQ; Tue, 18 May 2021 14:21:39 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lj0ZX-000zsI-5N
 for linux-mediatek@desiato.infradead.org; Tue, 18 May 2021 14:19:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=6l+fOgRHVXYTbt6GdJ5SI1B3WlaYCXRQFdlh2uABWsQ=; b=UYv5TKdNJj8e+TR3PW1lzhliNJ
 M6GXot1QF3FXNPzLURsgZzKpIaFRqJc9AeGsclEFoTa87rArFMcWRwF0kdR3M3n/+/M1Rur/izl30
 IVBn19Hu6Ya3GnqGl47KxVFY88J8rrih2KXo64Si+iaZticE8tvJFouWfgqNbsdKwg/ipMnxbg3Xn
 o/CyLLwirB7at9lY5hLHFo+yADb1za2mX9nbKRjwtruabn0IBlCzi3wMnO8bxzalzSW3/RCY2Eqfw
 KW+gyMImxju6Nmn3R9R2xcT5tIFEFsKVH9M0YgzKNMS7fe7AHT6p6Mfwy3YpgsypmfqdculbwqfVV
 FfpsTUXw==;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lj0ZT-00Eikj-3L
 for linux-mediatek@lists.infradead.org; Tue, 18 May 2021 14:19:45 +0000
Received: from guri.fritz.box (unknown
 [IPv6:2a02:810a:880:f54:8085:99d1:d3e8:47cc])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 93F001F42B04;
 Tue, 18 May 2021 15:19:39 +0100 (BST)
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: megous@megous.com, linux-usb@vger.kernel.org, a.hajda@samsung.com,
 narmstrong@baylibre.com, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@siol.net, airlied@linux.ie,
 daniel@ffwll.ch, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 enric.balletbo@collabora.com, drinkcat@chromium.org, hsinyi@chromium.org,
 kernel@collabora.com, dafna3@gmail.com, dafna.hirschfeld@collabora.com,
 robh+dt@kernel.org
Subject: [PATCH v6 RESEND 0/2] Add support for ANX7688
Date: Tue, 18 May 2021 16:19:25 +0200
Message-Id: <20210518141927.24795-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_071943_293290_4FDD214D 
X-CRM114-Status: GOOD (  14.79  )
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

(resending patchset with Rb tags)
ANX7688 is a typec port controller that also converts HDMI to DP.
It is found on Acer Chromebook R13 (elm) and on Pine64 PinePhone.

On Acer Chromebook R13 (elm), the device is powered-up and controller by the
Embedded Controller. Therefore its operation is transparent
to the SoC. It is used in elm only as a display bridge driver.
The bridge driver only reads some values using i2c and use them to
implement the mode_fixup cb.

On v5 we added the full dt-binding of the generic Analogix anx7688 device.
The problem is that for elm, most of the fields are not needed since
the anx7688 sits behind the EC. After a discussion on v5 (see [1])
we decided to go back to the original approach and send the dt binding
as specific to the elm. So in this version we rename the device to cros_ec_anx7688
and use the compatible 'google,cros-ec-anx7688'.

[1] https://patchwork.kernel.org/project/dri-devel/patch/20210305124351.15079-3-dafna.hirschfeld@collabora.com/

Changes since v5:
* treat the device as a specific combination of an ANX7688 behind the EC and
call it 'cros-ec-anx7688'

Changes since v4:
In v4 of this set, the device was added as an 'mfd' device
and an additional 'bridge' device for the HDMI-DP conversion, see [2].

[2] https://lkml.org/lkml/2020/3/18/64

Dafna Hirschfeld (1):
  dt-bindings: display: add google,cros-ec-anx7688.yaml

Enric Balletbo i Serra (1):
  drm/bridge: Add ChromeOS EC ANX7688 bridge driver support

 .../bridge/google,cros-ec-anx7688.yaml        |  82 ++++++++
 drivers/gpu/drm/bridge/Kconfig                |  12 ++
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/cros-ec-anx7688.c      | 191 ++++++++++++++++++
 4 files changed, 286 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
 create mode 100644 drivers/gpu/drm/bridge/cros-ec-anx7688.c

-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
