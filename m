Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95A2606A32D
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2026 10:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gabfugpU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=J4YiyeMpQnVQKucDulWRDveRXLLKWQOB9HjcaoZQvU8=; b=gabfugpUJA2PkE
	TwteFeTDazhY9nCBsBDNg1NE64cuwwHfCs42vx/+lc5mPtz7eP0FYVU5ov4z8BUMC5aZVQV/DeuGB
	bhjL55urHhBJDBJ3aD9b+EL98DDAHlfEUx9RRg0/f/6ETVOjeHBAkwktATjP/sW/ucpOX3gCQlG8G
	6i9/R2WxrM3PcPZAKRIrBkaT+sKdcNFLYbW/DvblxwjSRs7ooerZKGPQKCTz1a2YqEz3XnUu5gEbD
	9NUzU4ka4PgFHiJYKnOh0R5gnnU2l7oadHMmbzMsR7aupm7pl3dXjystQb2IzWrnsF0noM4Z4j2L5
	+yC7Q1C7pAF/lCLEscsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5cA-00000006Lrn-2Cnj;
	Wed, 11 Nov 2026 10:31:38 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5c7-00000006Lqy-21q2;
	Wed, 11 Nov 2026 10:31:36 +0000
Received: from [2a04:4540:1401:33fc:f5de:ef9d:4afe:312a]
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xR5bz-001V4j-0N;
	Wed, 11 Nov 2026 11:31:27 +0100
Message-ID: <794488a9-ff30-4864-af9e-f265d58e05f0@phrozen.org>
Date: Wed, 11 Nov 2026 11:31:26 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: en7523: add a reset operation
To: Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Christian Marangi <ansuelsmth@gmail.com>, lei.dong@airoha.com,
 Linqi.zhang@airoha.com, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>,
 Rajeev.kumar@airoha.com, upstream@airoha.com, Weifeng.xu@airoha.com,
 zhengping.zhang@airoha.com
References: <20261111085650.632025-1-john@phrozen.org>
 <20261111085650.632025-3-john@phrozen.org>
 <0c96f978571c569de6552fc11131e45b55cada1b.camel@pengutronix.de>
Content-Language: en-GB
From: John Crispin <john@phrozen.org>
In-Reply-To: <0c96f978571c569de6552fc11131e45b55cada1b.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_023135_544838_6CC8AFCA 
X-CRM114-Status: GOOD (  11.89  )
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
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Philipp,

On Wed, 2026-11-11 at 10:49 +0100, Philipp Zabel wrote:
> Is the i2c-mt7621 driver actually used with any reset controller that
> implements .reset but not .assert/.deassert?

No. Its users are MT7621 and MT7628 (clk-mtmips, which implements
assert, deassert and reset) and EN7581/AN7589 (this driver, assert and
deassert only).

> If not, it would be better to let i2c-mt7621 use
> reset_control_assert/deassert() instead of adding .reset ops to all
> reset controller drivers it is used with.

Agreed. I will drop this patch from v2 and change i2c-mt7621 to assert
and deassert the line instead. That patch goes into v2 of my
"i2c: mt7621: add Airoha AN7589 support" series.

> Is having no delay here valid for all possible reset consumers or are
> we implicitly assuming that this will only ever be used for specific
> i2c resets?

Only for the I2C block, which is a further reason to keep the
sequence in the I2C driver.

Thanks,
John

