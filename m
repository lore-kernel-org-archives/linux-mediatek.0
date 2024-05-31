Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D915C27C50
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 May 2024 20:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a9B0ojTRdLVSPqZj4HL0mnMQ3o0C/0sYD5JK6+HE7f4=; b=Fb7AaSV8KvBxUjT4frYkiYtBjY
	7uyORwFLuqhHzao2NgN6Pp2pWXCUqrcbLQsXplsMcVLKvoOT45bEeYFp7JD80Zhvyt0XSwPZyLq9m
	x5aqX15uTqKgFNUd34v/gLKxMDqNengkxQFsyRcSbL9OdWV1I5zcVIDcCRel9bnqK2pxdtDrDPc2e
	/TBSGxiy1Ms3d5i6B+/53crSk1oXPR+0JG5++4y3+dbRCSkJqeF+dEc/eZzhkAC4hl9B2dRPwbBAN
	+HmttowTHUTZUcKRdJ+hwiE2bCFT3klXGcqBBJWbWQx0S6UXMZ1R7G6rtJbaWr5Wx74ptQHj494V3
	7wvXg/zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD90e-0000000BOob-2D7r;
	Fri, 31 May 2024 20:37:56 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD90Y-0000000BOlL-2UfW;
	Fri, 31 May 2024 20:37:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0B1A2CE1A9F;
	Fri, 31 May 2024 20:37:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3C342C116B1;
	Fri, 31 May 2024 20:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717187866;
	bh=3TZNScVbrXSoesw2SWXp2AE9mBMjCfX0SRtPx+bRQhs=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=s09IE9TH7+7NX4fGYwfR697ra4WjhBGjhumR15erT2ntA3kBRBxfo8cwZBp9izirt
	 rLPvAZ75ChCKH6G4Dh2hC33YUb08V5Q+LHgXn3Za+QLufN0UoGRIUHCKQKIQboF+5Z
	 OJ6enNV/jsSDVMUDATB9Unothn2vdobk2AUPDeE9fLvjDwfXAH8bdDVV2Pq3M7y9Z+
	 c2NSjSnwQhP9I6c/wTlfPOM/hIgC3fOykjWtuh/0M/hjlsh/ER8YdvUIMOIBRYthcA
	 Fk2XwDSoIZYhctH1hKcW1iP5zuc3Ug7sF/bCs84AFLV5o1sL5mWhnMNTTvdl2qWT9e
	 04IEI24/H0NyQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2319CC25B75;
	Fri, 31 May 2024 20:37:46 +0000 (UTC)
From: Sam Ravnborg via B4 Relay <devnull+sam.ravnborg.org@kernel.org>
Subject: [PATCH 0/2] drm bridge: drop drm_bridge_chain_mode_fixup.
Date: Fri, 31 May 2024 22:37:44 +0200
Message-Id: <20240531-bridge_chain_mode-v1-0-8b49e36c5dd3@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABg1WmYC/x2MUQqAIBAFrxL7nWBWoF0lIqp92X5koRBBdPekz
 2GYeSghChJ1xUMRlyQ5QoaqLGjZpuChhDOT0abRbV2pOQp7jFlKGPeDoRzYtsbCmYUpd2fEKvf
 /7If3/QDT/D+mYwAAAA==
To: dri-devel@lists.freedesktop.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <mripard@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717187864; l=888;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=3TZNScVbrXSoesw2SWXp2AE9mBMjCfX0SRtPx+bRQhs=;
 b=RJEgq3whBcLtGPUqO61RcGUeDm3zjIZl6CXwG2rw8fjT9OIY0boyiUXJaUSs/arIEDMtutVOk/RW
 0rYZJj4HBkh7CmMlGVs/q7tOwueKNcbyRkN/Pl8QH21RCSMlvz61
X-Developer-Key: i=sam@ravnborg.org; a=ed25519;
 pk=R0+pqV7BRYOAeOIGkyOrSNke7arx5y3LkEuNi37YEyU=
X-Endpoint-Received: by B4 Relay for sam@ravnborg.org/20230107 with
 auth_id=22
X-Original-From: Sam Ravnborg <sam@ravnborg.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240531_133751_243377_C8C30D5E 
X-CRM114-Status: UNSURE (   7.06  )
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
Reply-To: sam@ravnborg.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

I had a few bridge related patches in an old branch.

They were last posted here almost one year ago:
https://lore.kernel.org/dri-devel/20220717174454.46616-1-sam@ravnborg.org/

The following two patches gets rid of drm_bridge_chain_mode_fixup.
The patches was already rb / ab - but due to the age a repost is
due before applying the patches.

	Sam

---
Sam Ravnborg (2):
      drm/mediatek: Drop chain_mode_fixup call in mode_valid()
      drm/bridge: Drop drm_bridge_chain_mode_fixup

 drivers/gpu/drm/drm_bridge.c        | 37 -------------------------------------
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 11 -----------
 include/drm/drm_bridge.h            |  3 ---
 3 files changed, 51 deletions(-)
---
base-commit: c9402efe492bb46ccbf94fedc4783eb8f8747567
change-id: 20240531-bridge_chain_mode-9ed8528e92cd

Best regards,
-- 
Sam Ravnborg <sam@ravnborg.org>



