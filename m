Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50504606A339
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2026 20:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J8URp39o;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nLn5fAo+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4rrR21eVd9MDJDLbl767Z4gPcJodTxC/4ECrTIhhUY0=; b=J8URp39o4/Vaos
	5MByHJD1n7YKDeH0YWpo59ABz8LSpZfCExGYl5LARFoCDPksjA5Qg67srKAcwu+VGklBqAAZhRHAh
	N4zTHvrUy+tCeOLold+txy9r7W/yQ4k4VpMWjLZhy7RLAXxva5RYTVJrYpeDwdagX1KoyUWlxOJth
	G92WXY2lr67yjd43CPdOtspp3kThTBbv/UOQSLWplG9bgNgwmhYwH2Ozf6zwe4ujRixtjnL28uD24
	YoiwFacN1GVZXA7v+Iy55viKTsdVznG1lOSn6PNiEdGNrJ0aKX2uqD1UiEQ4NE+U2m62p0Vbc89GL
	prHX5dRHtN6O9br5z8tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRyBx-0000000EUBM-0End;
	Fri, 13 Nov 2026 20:48:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRyBu-0000000EUAZ-3wzy;
	Fri, 13 Nov 2026 20:48:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4A9E860629;
	Fri, 13 Nov 2026 20:48:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 252061F000C5;
	Fri, 13 Nov 2026 20:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794602890;
	bh=4rrR21eVd9MDJDLbl767Z4gPcJodTxC/4ECrTIhhUY0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=nLn5fAo+VZEunWkRsRkeMZHc/RYC2cIr2i7ergs4c0cActC5esj7vXak6O4sVfAhA
	 rdZIuTFtSFdLiBIJ8fYOb9YFZVLkOhcTe0j9jukhvxp1j1ezWxvTC7kmGo2FA6oPN8
	 f+7tP3QGfnA1oG7mJxXu2PYZ30wsTp/T0UqU/uy/mAz9LF3Ht1/sQpAZQ8S+KpX8/Y
	 WKs5ES4PwK3EpbdX15+ZdwOjUWHE2roby2+Yk/NAiXPs8OvTt7j7SEWL61Z6mM1Bx2
	 ZJX2HQ+5jobTQxgcR1tlfoHFAR8VrZEOEePKT3id1WPTGiC4frIc10ApR31hP/nWn1
	 o8/DGVuZvXF7w==
From: Brian Masney <masneyb@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 John Crispin <john@phrozen.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>, lei.dong@airoha.com, 
 Linqi.zhang@airoha.com, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Rajeev.kumar@airoha.com, upstream@airoha.com, Weifeng.xu@airoha.com, 
 zhengping.zhang@airoha.com, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261112185329.1314427-1-john@phrozen.org>
References: <20261112185329.1314427-1-john@phrozen.org>
Subject: Re: [PATCH v2] clk: en7523: do not sleep in the EN7581 PCIe clock
 disable
Message-Id: <179460287736.1364508.7241698742869903903.b4-ty@b4>
Date: Fri, 13 Nov 2026 15:47:57 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev-7ca47
X-Developer-Signature: v=1; a=openpgp-sha256; l=319; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=DIl3GzMQKS3yYwlOjz8skXh4EnD12Itpf0Te4iUH2GA=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLK+l9efWtZ+8YHrzKpKJUll16B1DwpfF8/7+mpS9amdo
 n133JInd5SyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjCRUntGhqXeD2aELW/UvSPk
 9OvmbhOfnW/+531LLj5kuHKrLmvwzKkM/x0DFwvvsG99VSzSlBD45NKunJvb1Nknabv8WHdKaee
 TGzwA
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Thu, 12 Nov 2026 19:53:29 +0100, John Crispin wrote:
> clk: en7523: do not sleep in the EN7581 PCIe clock disable

Applied, thanks!

[1/1] clk: en7523: do not sleep in the EN7581 PCIe clock disable
      https://git.kernel.org/clk/linux/c/1346c1f94294

Best regards,
-- 
Brian Masney <masneyb@kernel.org>


