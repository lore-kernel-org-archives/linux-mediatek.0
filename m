Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18C9606A329
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 09:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TIfRvnUL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=N7HaPBFNC/ksv2Gq/mq4OqshzZisX2DBMIyRet24wDc=; b=TIfRvnULWFH6wlwhNikjUkX8MS
	xjeK9UV2kpjc34Hp9Cp0it+oDUNLYUw0xu5C1D5XNX9Mt90LG6nEFHngX6kyfONkPyrMhBTZluRlX
	8JeCafRIdPfGm1lLMadLNB+cDb2Qur4FaG77njNkMV7qCL3JRumIELcQEwbnFMqxD0aivwUDEqnq/
	DHwGfZ60ccC1clU5KxvI5bHHpXQvVTNc9WDdz1VLN93ABJMgmIiBa3deQAXWaDRGbJRPNkmfyvg3H
	GcUO7HlPrAr/yDvbXCGK6eHHx8PB2fyaLiGSQuI/Dgwmcsb+sqszmLpuQidxpQMyaJGgUmli2/0f+
	X6kLO5aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsac-00000001hZn-2Pwy;
	Mon, 16 Nov 2026 09:01:26 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsaZ-00000001hXZ-3jfO;
	Mon, 16 Nov 2026 09:01:24 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xSsaQ-000000007zg-05VE;
	Mon, 16 Nov 2026 09:01:14 +0000
Date: Mon, 16 Nov 2026 09:00:59 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hermes Wu <hermes.wu@ite.com.tw>,
	Allen Chen <allen.chen@ite.com.tw>,
	Pin-yen Lin <treapking@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Jani Nikula <jani.nikula@intel.com>,
	Dmytro Malovanyi <dmitrymalovanyy@gmail.com>
Subject: Re: [PATCH v8 00/14] drm/bridge: it6505: DP audio support +
 shared-DAI hw_params fix
Message-ID: <avrGSwE-Zocwtojl@makrotopia.org>
References: <cover.1790552614.git.daniel@makrotopia.org>
 <avhRv2PdtfFMOu2v@makrotopia.org>
 <DMWGDF7FB9IX.4M4NOJ417NRA@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DMWGDF7FB9IX.4M4NOJ417NRA@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_010123_927684_A41CF288 
X-CRM114-Status: GOOD (  10.15  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 16, 2026 at 08:22:23AM +0100, Luca Ceresoli wrote:
> On Sat Nov 14, 2026 at 1:19 PM CET, Daniel Golle wrote:
> > If there is anything I can do from my end, please let me know.
> 
> Yes, you can reply to the questionss I asked about some of your patches.

Sorry, I missed those replies, I've found them on lore now and replied
to them. Let me know if you agree with the proposals, and I'll prepare
and send v9 asap.

Cheers

Daniel

