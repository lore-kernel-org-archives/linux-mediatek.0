Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E87CF65DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jan 2026 11:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aTH8w0h3kKICWLf+Wiu0sGV5MiSH0o7xe3QPb1+JG0w=; b=fQy5MeFgjawUkJKnbaxoTI3Vvz
	yTQZwf2G7aeBtpEtIRTUXJxRSo8hrhSctZQ+0mAtFuO3VtcKUzNCRubP3M3Met/O5wMH7qwbMRtTK
	LBgWdgH1JyGqKJZyl1SylkEsGq1wwacmFYnkxlM0VfS+iu4PPpVOEfz8ZpcFl5q4q9+uR4ikF78Qo
	s1w0oZyXMmtBA/KVHoayoPpi4s5s47CAISI1Nq76/LFmItdDwTVGAcgt49FsJ3qyurYLelm7tCXS3
	HHckMsdxRYAh/od9v3V8aWZwgOt6/25GUmsRemY8Ukt2rssWDKSts6T3ol/jTQcUzIcVr2QBIdlUj
	86xnOnEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkKNd-0000000CNas-0WNz;
	Mon, 26 Jan 2026 11:03:37 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkKNa-0000000CNZr-3Hrk
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Jan 2026 11:03:35 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-47eddddcdcfso25009795e9.1
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Jan 2026 03:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769425413; x=1770030213; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aTH8w0h3kKICWLf+Wiu0sGV5MiSH0o7xe3QPb1+JG0w=;
        b=nQErWVHweoDd6CkClnMk0hqbDXXjbZzvHX4PQo2fbdFaON9HUWcSLn22o0rUtd6JxH
         QPN5k/Nlp0eqnthL0FkM4sIn7F4zYhJp2h2Z2pSKcL9j+IansJvPbtEySzGFkpR1BZfj
         EuGWr+UPNrp/ZA9DdPZ35fTOXRPYbGuAaYRcpnjudsLmCyrzOOcCI9EHHAxsmGSk3rCc
         c6fFYlfPponYAlBYJGfOf611rQSMGVCt4ImqmOAQmvMaPuu5rFLo2kcaWR+rYInzXCMQ
         6x4fnTuVNaZ1fksfF0uPnbRtAjo12TxelvqGvahefwq1E/1kvLVgIqzMvbF0CKsL+ekH
         5uFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769425413; x=1770030213;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aTH8w0h3kKICWLf+Wiu0sGV5MiSH0o7xe3QPb1+JG0w=;
        b=h5El9Yi8jgSJSPV6OMLr/T6lDP95cxqMmRRP65/M74L0lziX4FrwgYJI2YPtOXp1d0
         aK8da5XxnL1rlb/G+Ch8fc+4WXBIynwd766vQjyq5lvb8LUmpsToY4Hudf4uttQC7lRb
         9hQRMC7jT0FzMbY3q4Ia2R202l8AmnpDgJNvzwP01vY0z8JDFT2/4GsjUJta3rNGz4BE
         63XgtcTHng3KTiO560BqK283v1MTl/Bf0K7Wg5pUJZvW0FP17NM+OZT9i7D7p5SvFuk2
         AGA8UlLLtQ5D6uOtm8U6K+fa+g9MWUVgSx+WLGmdlRqOpGZABJopwl8kyri14FNrWgD3
         YL+A==
X-Forwarded-Encrypted: i=1; AJvYcCWHls8slhxBip5uk6vV2JMjsRpdwzNi3j5g/83IfQnAaIOUKb98fqitc2TY7MBCPb68G3kb82qP6X2Svp6pvA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6jx2GsfHcMoPz0uDe69Z8swySY0P+SOgwgL8D4K1or+X3NEOg
	8VIYF465HyztOu+oCJBSncAkc+qywCa+Bh3Q8VZ4RrUJdMxQNYiRWynjiRk8WCFK
X-Gm-Gg: AZuq6aKlhKObBqAfjVpQNwX/75csaJmQGazwrZfXVDaiuFTqy0w7EqPTtu38dJb1g3V
	nZvgTIK4YKp1Ycs+IPbXJ3A7y8FZhSZbgQhyvj9kqKOUqoR1Zg7QW3VZ6WI4tb3QiXaherjmgcd
	9lkGb7poqu46Y5fIWloLMfOJFWhjFPVy2XOdevbElNTPDpXODvB08PngY1wV18efvuz7/96QQ0j
	5+bFCYdb8JVAq3xIPpH/K0OTiKYAsplLQIEQDpnMsLm2JMcWVlt3TBCiCmFYR26gFQdmSvyI2RJ
	5Tsm+AJki9UJ0F0Jp4No8qnMzbCODH/J3ChR+46qs5v5M01QYVdTou/ZJqvP/diFZqiHaFUCMlv
	U1A3+0tWLIJGqjyVMYiTWr/oJoQAeiJNiW1jBsGZr6u6FcEUGYQDqYVpbBmAtJfiEvGE9fUBuNZ
	00UJpShA6FBrpTyCVlNDURsTk1lPXXaaHMw3xckW0=
X-Received: by 2002:a05:600c:3113:b0:47d:403e:4eaf with SMTP id 5b1f17b1804b1-480650f2933mr10392565e9.10.1769425412353;
        Mon, 26 Jan 2026 03:03:32 -0800 (PST)
Received: from Ansuel-XPS. (93-34-88-81.ip49.fastwebnet.it. [93.34.88.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d85d146sm286254045e9.8.2026.01.26.03.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 03:03:31 -0800 (PST)
Message-ID: <69774a03.050a0220.3a3ac6.305f@mx.google.com>
X-Google-Original-Message-ID: <aXdKAHW0z2qC7s5e@Ansuel-XPS.>
Date: Mon, 26 Jan 2026 12:03:28 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org, Felix Fietkau <nbd@nbd.name>,
	Shayne Chen <shayne.chen@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	MeiChia Chiu <MeiChia.Chiu@mediatek.com>
Subject: Re: [PATCH wireless-next v2 2/2] wifi: mt76: mt7996: Add eMLSR
 support
References: <20260125-mac80211-emlsr-v2-0-466329d61c88@kernel.org>
 <20260125-mac80211-emlsr-v2-2-466329d61c88@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260125-mac80211-emlsr-v2-2-466329d61c88@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_030334_819000_90D11F64 
X-CRM114-Status: UNSURE (   7.54  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Jan 25, 2026 at 11:51:31AM +0100, Lorenzo Bianconi wrote:
> From: MeiChia Chiu <MeiChia.Chiu@mediatek.com>
> 
> Implement set_eml_op_mode mac80211 callback in order to introduce eMLSR
> support.
> 
> Signed-off-by: MeiChia Chiu <MeiChia.Chiu@mediatek.com>
> Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Tested-by: Christian Marangi <ansuelsmth@gmail.com>

--

	Ansuel

