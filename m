Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373DE606A331
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 09:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ifhkm1GU;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Su5MkqYw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tsSv8AXKdn74dLQqZ+Pw+96MlkzYgFsnQpQ9ZDWK5PU=; b=Ifhkm1GUEHFZmk
	f/RTi5ExZ2zreFA/irhMrjhq75j4ngxAEajO4O+rMpH5HGjQOpXwCyEhJ0T/T8Oi/u4luoz+H+sMp
	7BBXWPgd/dxhMvAGAESExwxP8bHvN5GJ9wQDqYd58Hf2Hha4wQ3F51IEFgL4LUjN5pQexwjRFAFcQ
	jtaYpFotOokmmPyJ4butowRHAT5bchMQjglXyIw06nW2Kr8H3hIq/yhAAuFaH1nxsgmFOYTFRdGUL
	zUY2tAXGznnowdGXsjm1cSZYKhdxwubDIpisQN3PcxSZiXWbwspjB82nNJNONNQeirkpFkGYZzQfI
	n0d15kFbBev0tf5TFOfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQYx-00000002nBl-3fz8;
	Mon, 23 Nov 2026 09:42:15 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQYs-00000002n7l-15n2;
	Mon, 23 Nov 2026 09:42:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795426923;
	bh=S24fkSd1EQP4rOBdYiQSTxbzQ48LBCI/965cSSyCzRc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Su5MkqYwPsO9vse+8XqNW5Uhvk5SiJLPabfmUZfHNJsWpR57AYGiuf0lo10BcXv90
	 Ezt1PCg43uVdg3RErbBCm4JMQ2Oa6oQ253vvGTomD+v3jtIlbNdlXo6qpB5cnopg0N
	 ubd7BSovGhNtLNnn36XotKtX5BE6gOebZOKo1uBWCFXMZ3eFaO87iQkNQju2oeSxan
	 J7skIs4UOf5DSUkfeZS88sKLnFZYFGKmVAcDqrrfBODQfGz5HVJslfv1SXK6HX5i4Q
	 T3HhltHfr9HnMVrhYXDrmOmKQiKvyn1LNysZ/ReLKoLd68HSJGPX0//028EVAVdj3n
	 mQtY9CoGPRpTQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A516917E04F7;
	Mon, 23 Nov 2026 10:42:03 +0100 (CET)
Message-ID: <f6c16695-35b9-4d59-bb3d-fc247e2c278c@collabora.com>
Date: Mon, 23 Nov 2026 10:42:03 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] regulator: mt6363: Serialize BUCK_TOP key access
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20261113-rgp-91-mt6363-key-lock-v2-1-adbd48f0f830@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20261113-rgp-91-mt6363-key-lock-v2-1-adbd48f0f830@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_014212_700849_AF16C4A7 
X-CRM114-Status: GOOD (  10.33  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/13/26 06:29, Alexandre Mergnat wrote:
> The bits that select the FAST mode of the bucks only accept writes
> while the BUCK_TOP key is unlocked. mt6363_regulator_set_mode() unlocks
> the key, updates the bit and locks the key again, but the regulator
> core only locks the buck being changed. When two bucks change mode at
> the same time, one of them can lock the key between the unlock and
> the mode write of the other. The PMIC then ignores that write, and
> regulator_set_mode() returns 0 while the buck stays in its previous
> mode. mt6363_va15_set_voltage_sel() unlocks and locks the same key,
> so it can also lock it during a buck mode change.
> 
> Hold a mutex from each unlock of the key to its relock, in the FAST bit
> writes and in the VA15 voltage setter.
> 
> Fixes: 3c36965df808 ("regulator: Add support for MediaTek MT6363 SPMI PMIC Regulators")
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


