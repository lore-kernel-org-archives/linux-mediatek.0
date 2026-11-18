Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37140606A33D
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2026 20:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BW9Zm8OJ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PTRFYQ7x
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/RRjWL641RBXdzvfFkW2sLfC2on1rvjj7bWT9M3oy9g=; b=BW9Zm8OJ4Mc1uE
	Aoyb+n1UnNilMAKwuUg4WXlcgzE6m52e+ayN7yT/Q03iFOZp0xO9EeEO/rHz1AWqoTOMr94d6MnCI
	h1uG14OvrJ7t6TXwDviCddaMdewjn0Cl5pRJcTOMIYFAC5c4gS5eNEkXJN9afNUEyzR9CiBB0EhHD
	D89EcCfoS/afkg9+m6LusuF/zSyh/UYrxrr8NToODEHwCpqpYDzeDvqgZkv8zEEi1/7jSQKKUCBcL
	SQ01lBIZsE6o+R0q4IA+pvRErQnRM5M+wGsiRrVhGLN25JZQGybGw3ceexUcvcF5MFlHA013SYIAa
	4W19WLJuE/kaTRbzqDuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTly1-0000000ABb4-3tLM;
	Wed, 18 Nov 2026 20:09:17 +0000
Received: from mail-oa2-x0a.google.com ([2607:f8b0:4864:30::a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTlxs-0000000ABXp-0EZC
	for linux-mediatek@lists.infradead.org;
	Wed, 18 Nov 2026 20:09:09 +0000
Received: by mail-oa2-x0a.google.com with SMTP id 586e51a60fabf-4b5cae8da04so467414fac.1
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Nov 2026 12:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795032547; x=1795637347; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/RRjWL641RBXdzvfFkW2sLfC2on1rvjj7bWT9M3oy9g=;
        b=PTRFYQ7xRIdzLJ6hCi58jbrqNgdDX7FWgy5/jXpPdk8UmwpLu5FA37oYKsEkaLWyI4
         k98FYHl3eUescJH2sMdUjGZ/LScY6S6a5INnTGM8IIm9xG40+CgZHClxTERl5vVmJ9Sp
         w9JXGjW2ODqmDnb6H0mZaW9ykgEvycBr6kJpGFy8LL1E4g6zd6M3Jt1BIBKd37hYW3Ly
         iVOwy6ib1MQAU+AFdx2Al9G18pdRUoUHFWTXA9mmjGsHDeYsoJwK7DCH/brOi8g4iRuE
         0vfET3GKg5FBucm5785/36DKDsKy1m6hoeya5vgq9fv5mpmR3C4HN0FN9E1mr8d/r4G0
         Fdog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795032547; x=1795637347;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/RRjWL641RBXdzvfFkW2sLfC2on1rvjj7bWT9M3oy9g=;
        b=a9BQ1NzjKqbFGmFxk/eJ5u+PCxY2B+aypFGMJXlO1/yKWKZjovjFZ/41kNlXzS7R1P
         BtRn5wjPFM1ozilamQLFtyjTBZDKSnH4eYZh+A8W0S07b+UCeiMNel1YHHJIhrJ0nBeu
         ZZgsM8S1WjnDyauM6c0Ad6FaBZK/HTTUQEiolb8ZlcjjrYrFyx2r+UN4UcVspwRXzGpF
         heYai3dsvY/J0/1pIviKahH3GHyhYhad5/a9iwgFFQd60lohrsHvwI+hFudyvO5FdtRR
         91PN4tAsHvFIky7bwP/LDYk2PD+dcKe+Obph7qnd9CI08zU7plKbF/60UnwXkBC2j4Ui
         yeRg==
X-Forwarded-Encrypted: i=1; AL+hErELTbNb4DElsYP4mQfZtr3siHMdZxxv1TvX+4kt/Ctz/TWXNMFSQHATcfYyZARDFrtc0M8f9hX8sP7mu8QTEQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z/IG/oycXp9JXbl1dhrC56eCgLzjzZoJ7Pz65Yb5OfrvA5GY9cT
	tXXGGpCmc2QKDZxGtE6pVWmyHlDAqwygH/SAwxLZNPdxOiBIiLkkVBm0
X-Gm-Gg: AYBFou1KaP4gx+FVVIHDyVrxQQpa01AZqjZ/jjeox9BUIt6CKdfDuO8f/vQbQ49BVvX
	s25nHzvX4/y777M2VJL+iN9gatufr4vHSScDsqmuTEQivkYU56PoqZdLXjL77kKAAwxhwTYFh6t
	pe0XhtemPDke2w0KeCSkcwsxSVbXphsNsYLam1ghWUgru4M2XvSyFSU+3+IsT+IxKuH6uRp/UP0
	KIrajs9lePbEq7iTTzjveoGRoWFoFgy49yZ5BhjBz3bRjDDTSkoOnKRaARlpQWYF0PHqY0aWVDT
	Ak138mUiOHDTMNyuzI90j3TOD8vv4nqD53GBJxxaqlbBMHoAx01PvvlpFAaAFIvwukRT+M5XeQy
	6+fFNbxsxBHEXlZrNsBE+hBc0eB9g/GsjmFLQZH3DhLxUFos98AxvGV1gCVW8Ov4lHNZalVWUda
	dvU823NZD4OyxpCQgrqO3vJNe8TwjMy5fBI6YsBrmYY7owUFHWxIUYdrIS8/WDawtdOhh+PHJTF
	j3QwEXmh8tZpEOYCZuhdr46pVldgkxiqu1gjvhvmIx91Mdbr/Yf7T98lXyquk2L0lkdd9jFAoIe
	psUqkUGRXYmWyZc5Zcmw6relU0+kdIpAzVyVbHT00M5AsFio5bDmviag3pkIza5aGa2cyRyMAkV
	oeayRvEJ6VgVSJ85AnI7iZf/IgFAQInLaFVZRg0Yn
X-Received: by 2002:a05:6871:5311:b0:49d:e1d3:e6e5 with SMTP id 586e51a60fabf-4b75d550969mr3282678fac.43.1795032546658;
        Wed, 18 Nov 2026 12:09:06 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4b7437258efsm3148235fac.5.2026.11.18.12.09.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 12:09:06 -0800 (PST)
Message-ID: <b662ae67-94a2-4e71-9578-d380ba19938d@gmail.com>
Date: Wed, 18 Nov 2026 14:09:03 -0600
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: rva333@protonmail.com
Cc: airlied@gmail.com, angelogioacchino.delregno@collabora.com,
 bisson.gary@gmail.com, chunkuang.hu@kernel.org, ck.hu@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, p.zabel@pengutronix.de, simona@ffwll.ch,
 stable@vger.kernel.org
References: <20261117-6768-dsi-fix-v2-1-6654a072884e@protonmail.com>
Subject: Re: [PATCH v2] drm/mediatek: mtk_dsi: do not enable HS clock in
 pre-enable for LPM panels
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20261117-6768-dsi-fix-v2-1-6654a072884e@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_120908_100313_2B2C42C0 
X-CRM114-Status: UNSURE (   5.89  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 17, 2026, Roman Vivchar wrote:
 > Only enable the HS clock in mtk_dsi_bridge_atomic_pre_enable(), when
 > MIPI_DSI_MODE_LPM is not set, and restore mtk_dsi_clk_hs_mode(dsi, 1) in
 > mtk_output_dsi_enable(). This is a no-op for non-LPM bridges.

Tested on MT8173 (Amazon Fire HD 10 2017). The Novatek NT51021 panel on 
this device sets MIPI_DSI_MODE_LPM, on v7.4-rc3. Tested with repeating 
blank/unblank cycles, and verified the init commands complete and the 
link ends up in HS video mode as before.

Tested-by: Ryan Brue <ryanbrue.dev@gmail.com> # MT8173, NT51021

