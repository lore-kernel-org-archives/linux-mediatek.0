Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6158F606A323
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 00:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aJP/CQV7;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A+6Jj6Z/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9Aotji1bql8zF+cwWe5ycVMLLsexz6kp97BBy83KPIc=; b=aJP/CQV7MlaahAMMkyyZtClVOw
	OOCq5gbvEBnHDvT6GB4sWaYXFHeVevfoJEXGXZ+r04EalC1iN93+mswiSmGPmDbtZnJJu4OOqtwiX
	lki9JJulRahhDJN8o76L/hFlSISnPwV0nutQKUYLwbu+EjE7NFzbJSclfqX9Zk+wHg6M2HzRjExAN
	UkJ7Jc2Q+WcqSvFP8tMVIUrWrZVURsaNDkiuZDQrP8xgAW8g0FVpZ33bdyo1r58d2oka7vWCs4hwD
	VC/foBEndXspoF5AVNzXJglbnGOi+dg8kQ7pbhW7HVx2+Yn6u2JbHlFQLeZjwG8GtyOYJyOypYKb9
	FzTWlpcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNkT-0000000Bid5-3yb0;
	Thu, 26 Nov 2026 00:54:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNk3-0000000BiK4-1txN;
	Thu, 26 Nov 2026 00:53:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E88024359C;
	Thu, 26 Nov 2026 00:53:38 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795654418;
	b=d6QfRXjSrvvItr/6+cadxAKZsoG7FrUwCzpclttemOKQEJ70+s5UbJvPpbmFtFGnlYoS
	 lDVOpy3EOaU3Z0ExN26PZkRbszVRdvCh0POPhvpVqVAX//scVCNGXVV5rv9IE4LXXxAST
	 H7Kfe2mr3M5USIep+kBW1sDQsSu6cc3LoATytkMcrfPsHGBThSsjSS8KsMPT/YWlls0hF
	 SaHQVpTqqhD6qv+bOkxWEbawVU/Ts6MPOLoB+PAQOJzU3aPo5+VjUP4PWzQvBk0xRflTw
	 5CvCCLdbaQv1K7RlvSJE1a+ZNBZ9IHVLmdIhbOARus7lQnONE5j6TbZwgCs7PZaixWw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795654418;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 In-Reply-To:References:MIME-Version:Content-Type:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=9Aotji1bql8zF+cwWe5ycVMLLsexz6kp97BBy83KPIc=;
	b=KWQ4qk7Zibmd0PFylKjhXmIX7xYYgBAEvjSUTjaoZI4orCDEkXPVDKs14ob+9+8RbOZ7
	 onMo90rMcaaWgxvDVG1ghgCQen7flUwyjpdK4h7iccJhH1kC4xHwhSj/+51TKV7uNmNtg
	 fVO+nwdutZ3LqQ11c9FUxmihnsqOizrDqRFBoDrVpCMPm294KYTNlHzDmEoZ+ZRByYYb1
	 XROVs1nYQSAi36VA74dZAsC/3RfTYA7K7eoaQ6PbgSWI0LO7Tq21Ue6PrW7FbnNtVmBED
	 tx1sv3VHaLLTDoZrXztPu+hG9cTSlBPHdUFJcHUzYYzLqnbJeOP5/Rgfko/xpGpYLxw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7F3F61F000D4;
	Thu, 26 Nov 2026 00:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795654418;
	bh=9Aotji1bql8zF+cwWe5ycVMLLsexz6kp97BBy83KPIc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To;
	b=A+6Jj6Z/9PXSgpr2AaDPkLXxvjSaLnwhCyGp1VaPVt6arcGVt0aDUEwzEIF+aknEd
	 8XNhIOwppq6ui/9h/CkwVuxBpWosc7WzjI3qh2AO4Sip4MdLu+nCgQVA19nUC9JpEd
	 vyZD8HMhIIGqyuY+WCP1voFhDwVGYWNEZAv881M7r5VqoVbe/T5qQPXrOPIqejCiRR
	 ZoQIiqGrkVPTuaOjvDh5jj+OMM4gLxXuKj5Ye0Pl3fySXVaF4VQgrZWNX0S7fgxt2n
	 oMDKSCfhcqo9fY24qdJAgcsltbGaYVR2O9ywManIUWocS9Jej54gPMcq7MTEqpUg20
	 OW7r/dbVqcZ/Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 074694D134;
	Thu, 26 Nov 2026 00:53:23 +0000 (UTC)
From: Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org>
To: daniel.lezcano@linaro.org, rafael@kernel.org, rui.zhang@intel.com, 
 lukasz.luba@arm.com
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] thermal/drivers/mediatek/lvts_thermal: write
 LVTS_CALSCALE in lvts_ctrl_configure()
Date: Thu, 26 Nov 2026 00:53:22 +0000
Message-Id: <20261126005321.71799-2-iasnezhkov@gmail.com>
In-Reply-To: <20261126005321.71799-1-iasnezhkov@gmail.com>
References: <20261126005321.71799-1-iasnezhkov@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795654401; l=1283;
 i=iasnezhkov@gmail.com; s=mindone2026; h=from:subject:message-id;
 bh=DfpU2QqoC6gb2t4TCCBuYupqgxwpLO6QVGeUXzAFNXc=;
 b=2bySduS9R3VaEm073Or1qqjPHuTmVrGNaFcC5OQ3+Hzxz0rBhNpPxGJrdIyjy0OFVMdrBP23H
 VOVIOeoOk4oA+ttzyrJlMXKFNcbVolhIaKRP+68BAlRlYpSfVYocuvB
X-Developer-Key: i=iasnezhkov@gmail.com; a=ed25519;
 pk=hQgXfiWi4ukk2jh4BHu1vRVhg9BUivo//AFp50AKMag=
X-Endpoint-Received: by B4 Relay for iasnezhkov@gmail.com/mindone2026 with
 auth_id=1643
X-Original-From: Ilia Snezhkov <iasnezhkov@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Reply-To: iasnezhkov@gmail.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ilia Snezhkov <iasnezhkov@gmail.com>

lvts_ctrl_configure() assigns 0x300 and LVTS_CALSCALE_CONF (0x300) to
the local variable `value`, then immediately overwrites `value` with the
LVTS_MSRCTL0 filter setting without ever writing LVTS_CALSCALE (0x0048).

Remove the dead duplicate assignment and write LVTS_CALSCALE_CONF to
LVTS_CALSCALE(lvts_ctrl->base), matching the comment above it and
MediaTek's downstream soc_temp_lvts initialization sequence.

Found and drafted with an AI coding assistant.

Fixes: f5f633b18234 ("thermal/drivers/mediatek: Add the Low Voltage Thermal Sensor driver")
Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index 350fffd..e034c6c 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -1197,8 +1197,8 @@ static int lvts_ctrl_configure(struct device *dev, struct lvts_ctrl *lvts_ctrl)
 	/*
 	 * LVTS_CALSCALE : ADC voltage round
 	 */
-	value = 0x300;
 	value = LVTS_CALSCALE_CONF;
+	writel(value, LVTS_CALSCALE(lvts_ctrl->base));
 
 	/*
 	 * LVTS_MSRCTL0 : Sensor filtering strategy
-- 
2.54.0 (Apple Git-157)




