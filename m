Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D8A606A333
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Nov 2026 10:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qGE3jTVZ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iJodq1ml
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=1x0su3qFIaIhLOOHVTg63Xzz5NRDGI3ilAjVRn4Y+J0=; b=qGE3jTVZApTAvuPlBMCiKMb/ky
	oXsklg7gKnpmjem1/aiDC3xSIHsh/43sWUTh9Pf6xZsslzYeKUleG/T3ZVBVdyJU6TMSwgNHmd+2u
	AV4QZP8tM7DKrl5rGJ9nq+N9V1Wsi+i9gnqiJBe4KAfYHddlPK6RDbzg08eKC7Zn/oVwl5rUi5ADX
	XyEjtbqkDnoV3lQwcpisC0WFc9o8Txstps5KxmM1WqBt6KsoX0yvUXHAyQtUyITpM2/Yv+XIxbSyE
	EJNy+N/U2tRIQCBjTBvzubxRI/xG8tAVbDz9Nls+r5FFtlNDJpRc+IMjDqo8LNqdPZmOupbnlejEg
	5/wPnPwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdQm-0000000ESNM-2ieE;
	Sat, 07 Nov 2026 10:13:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdQl-0000000ESN8-0dpF;
	Sat, 07 Nov 2026 10:13:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1CD65601E3;
	Sat,  7 Nov 2026 10:13:50 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794046429;
	b=BFFzFEyLQlad4lN8VqQPiQP9oB9Z2XmmXQsUhIsTUSdXPmKl6yJAKjCgM6cynk4VQhNs
	 A7wdrZtbV2nCCQNhiPzwp8wRl8kG7JUKgLfqDMZzq9UnLMGkw7+EgYg92lQDsYcZxsaKp
	 HWbzJqX6KCngXz6zl7x44T+P1PJzjMCBF9xK5opvBpaTdaPcYzub4zXanxOZKo7MvwboA
	 jLZmfVdnBOG06whPTNnw6e1fhxfVZmM1CzOe9yaffkuTPBfoFgoRk6uP1qGkGsuHYXVIh
	 m7QmG335LpduEVbmdMH3b8hUqdjOW3EYikgK+Y1iUl1DUeL23RqSwQqu9+HBD0vFNRw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794046429;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=1x0su3qFIaIhLOOHVTg63Xzz5NRDGI3ilAjVRn4Y+J0=;
	b=xr2nd3/g0n7ooPr5PiV1VYx6Ry5aK2D1CQqXEjrh02qcSgN0t2pWfUYYz7ETV7jQ/34o
	 uqfJnzU6R7TpIGjMc4AHz35qx2mI02X2ONvuBy3Z/Coe+VIh78NATsrRb79sN2rZD1drZ
	 r+ks9c4Z7+v6jg/UiTGxhYKem6crjbAoItEPjODEegOQyC050YqexT64oOmcRUeUMTDhx
	 OM3fIHfnM5cDWoXyLPxqMVEtr3YqFKFkwTLDt/GmNPpRQU0NLCM0V+ByUE/y7jAiHqgEA
	 +yRRz0VxNXUzgnzbhHz2d/RvoLkMNMc+E4wD4NaWSpJ8otyoeWZdeTeLlmoMPW4w1lg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5BF8E1F008A1;
	Sat,  7 Nov 2026 10:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794046429;
	bh=1x0su3qFIaIhLOOHVTg63Xzz5NRDGI3ilAjVRn4Y+J0=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=iJodq1mlSBtu854QVQ9ONyTD8j5Q95lYmdwTqfxnAsksfn20dPcESK1HxVB7tUFK5
	 8QaQrGLUe1AapT8b4xshPMS29njcmVSln4HZzphVip6JHGzMXsh1jrv8hGBhUisJ8h
	 hmDVZczDUcf8FmRlM3CKW3/ivKDGOjmAlBJodUEqsh3PgMdvZOSifiQm/qvt/fQ5jj
	 W1uPPB0wrLYe2rEvBTxPfO6l5/a1GlCknPpDAwv3lKc6fbb2snBCmf00ifLCiIW5Yb
	 3b8Jg+Gghcmo5pYCo5po3Ex7lwIjfWjuqakh0tujF9H1VCz1el5GTupr8F6AKd+z6o
	 eqplaZPvdQacQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E1B2C47B59;
	Sat,  7 Nov 2026 10:13:48 +0000 (UTC)
From: Rui Cao via B4 Relay <devnull+i.udp0.com@kernel.org>
Date: Sat, 07 Nov 2026 18:13:43 +0800
Subject: [PATCH] spi: mt65xx: Remove the CPU latency QoS request when probe
 fails
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261107-mt65xx-qos-fix-v1-1-9d9c16a584e4@udp0.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQwNz3dwSM9OKCt3C/GLdtMwKXWOjZBPDtBRjC9OURCWgpoKiVKAw2MD
 oWAi/uDQpKzW5BGSKUm0tANz3mEtyAAAA
X-Change-ID: 20261107-mt65xx-qos-fix-32c41fd385da
To: Mark Brown <broonie@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Leilk Liu <leilk.liu@mediatek.com>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 stable@vger.kernel.org, Rui Cao <i@udp0.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794046428; l=2424;
 i=i@udp0.com; s=20261107; h=from:subject:message-id;
 bh=J9ck0Rmxdd1nbYdPYBN9FG+4oXVrAofA+j7Izp5hqPk=;
 b=REkzO9qjpDLtQwUJ2L7TcXugkI2yWMutN5NdD7o8ySpatBLXAbAjyDeG80TTMDedIQn2d/x9A
 T87E08PacYsCghHh8+DjFlPTrQv5tXsVOQTQ3KN19p0+P+wXDg8ZjGo
X-Developer-Key: i=i@udp0.com; a=ed25519;
 pk=XZJKcKgnUUjjyw8KuKy7u2QeIX0JLY/L1Fxzwwje41w=
X-Endpoint-Received: by B4 Relay for i@udp0.com/20261107 with auth_id=1443
X-Original-From: Rui Cao <i@udp0.com>
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
Reply-To: i@udp0.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Rui Cao <i@udp0.com>

mtk_spi_probe() adds its CPU latency QoS request before the chip select
checks, the interrupt request and spi_register_controller(), and none of
their error paths removes it again. The request is embedded in the
driver's private data, which devres frees once the probe has failed, so
the global CPU latency constraint list keeps a node in freed memory. The
next cpu_latency_qos_add_request() from any driver walks into it.

On a Redmi Note 13 5G (MT6833), an SPI controller whose probe failed the
pad_num/num_chipselect check left such a node behind, and the UFS host
adding its own request a moment later oopsed in plist_add():

Unable to handle kernel paging request at virtual address fffffffffffffff8

The same happens whenever spi_register_controller() fails, which
includes -EPROBE_DEFER while the chip select GPIOs are looked up.

Nothing needs the request before the controller is registered: only the
prepare_message() and unprepare_message() callbacks update it. Add it
just before the registration and remove it if the registration fails.

Fixes: 632556d5799a ("spi: mt65xx: add PM QoS support")
Cc: stable@vger.kernel.org
Signed-off-by: Rui Cao <i@udp0.com>
---
 drivers/spi/spi-mt65xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index b845a599f7c..49c31d4bd71 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -1295,8 +1295,6 @@ static int mtk_spi_probe(struct platform_device *pdev)
 		clk_disable_unprepare(mdata->spi_hclk);
 	}
 
-	cpu_latency_qos_add_request(&mdata->qos_request, PM_QOS_DEFAULT_VALUE);
-
 	if (mdata->dev_comp->need_pad_sel) {
 		if (mdata->pad_num != host->num_chipselect)
 			return dev_err_probe(dev, -EINVAL,
@@ -1323,11 +1321,13 @@ static int mtk_spi_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to register irq\n");
 
+	cpu_latency_qos_add_request(&mdata->qos_request, PM_QOS_DEFAULT_VALUE);
 	pm_runtime_enable(dev);
 
 	ret = spi_register_controller(host);
 	if (ret) {
 		pm_runtime_disable(dev);
+		cpu_latency_qos_remove_request(&mdata->qos_request);
 		return dev_err_probe(dev, ret, "failed to register host\n");
 	}
 

---
base-commit: d48723711bae9b8cdc56719c448ba42fef28cbee
change-id: 20261107-mt65xx-qos-fix-32c41fd385da

Best regards,
--  
Rui Cao <i@udp0.com>



