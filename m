Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3AF2606A8A2
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 14:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q6Gp95XS;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cclKC4VW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tG6neAVh4oCzGf1sct8/MQCA9dZCIT+3BlbcZwi3Bb4=; b=q6Gp95XSWRwqgAIncYwYx9T0P8
	BjG9CAKDlG93D+39BlInlH6bGMZik3noUMRIE69svoYmbxAsrPhQuZJ/XQBiOVSML/cXBcVtg2842
	8/Bas0RJkhc0nAtlQx11AttHQEfncnVbby2DU8+dOBEV366L40ht2xRudx1yS4O4YJDUim90FZHgd
	Rz0hcJhLZSl1UkpKk9SzUlB01mCgkgcf+RLypRvisksg7y2pAA6cUmTk/XJeZDPyd7Ki8AMu1q7UQ
	sEyB3+0Anjiszn1K5zG5qwkHLm0hm0Qzn730TxtqFxtENqGkze9d1Kh4PqATugtXDfTNKXk66upFG
	bC+/s53w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJyx-000000064zj-1hZE;
	Tue, 17 Nov 2026 14:16:23 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJyu-000000064yt-3FL6
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Nov 2026 14:16:21 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-36dbde64409so6966013eec.0
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Nov 2026 06:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794924979; x=1795529779; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tG6neAVh4oCzGf1sct8/MQCA9dZCIT+3BlbcZwi3Bb4=;
        b=cclKC4VWwqAsTIEuL2Bp3EnY7TQFr8pqiYfaO2WtfzaLTvBQLl3doaRYReBMcYPd4d
         FOp3rUJHzgIY0Ri6lOiKMuvAMO/dHgqt0B8PgpceZqNAjFWf2+piS4/2dc5jmOXgpL9B
         D22NFet7Z1PXeeYnGLBjwJ1P+Kjuj134xjNUtIUYn67bH7Yn8Kr0mxv9GOAs5ogSjC+K
         P0txGsj0rZUIshsuspSBkJrHe1IsZD/g3eJ62XWUQDXf6k7RJG9l09lrQKpuoMDgDVyb
         lnZMn1G0161n/CAZ4/VJy0g1jfCV06kTyywU9qKezua2IdRoFbl7obDb6OjXLTLIvsG8
         gtBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794924979; x=1795529779;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tG6neAVh4oCzGf1sct8/MQCA9dZCIT+3BlbcZwi3Bb4=;
        b=ngAspomhmrFgE71I+6VYsiekciRKk83y85ngjlqtRr1UB9WGWw9MdhdG+mNZE8Dcxo
         B35j8uTYsTsUsTO0CqqCmXnWS3Ve5gzEG/xsuzh3tgZVfs4NPl/E+cdDAqjslxmwfBGi
         fw7/7gXtYRB0vtyHy5byEDwo9fBsUczNznGcN6J7bQdCTwOyx8Y9ABFWJ8NQwYrMMzvC
         rrUaLl0uTV3Q90QYHWOQmzDW81qbTHrMaAxhQ6xdN0+Jrq7ON6lLJ6gp74gxpu8jUnNr
         LwMBStkhXHjrEfE/G15gRIOBvKwnn95ll56TugI5O89WX74on8KRhf4YjNYtGcMbDAW4
         6jkw==
X-Forwarded-Encrypted: i=1; AL+hErGUiq2bhB4pNy3vsXI9Qv/bplPowAodXVP7OhOf/xcRcgtz0D2H8eNkF3oer7mwF8+QVLo0QHt5kC/jnzF9eQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z8IH3QwydZvWvmYy4dgfn1bbsf26fJgT4f7XuGKSrO/gOOQZ2Yt
	vczzHgGmr5AvVobGWQRyJjtuvWBr22ZqYpIEpCB0c6bRPCNGgbfjMpNJ
X-Gm-Gg: AZFdTZfXVn16gjKA6BamA498SkxtMY83ER0thhGpKcED4T9N4Zvo7VlUzBXP6o8rLy3
	yjniJM1cgWSqnJ9M6/VfRB14U2KZTJmVRMpB/0k76OFmzGFVIcCnBeTurmWwvArNlUWm7qxFw7s
	obEx7lv99dBTLKo/mcZzKD93uJQagO2lH97RgmkfUNSZscC9INFkSOdcF1ZfzuO63GlDZiyKIzy
	7eRAwwu3qHCkGoW+CTrdrspFcd2Dfzky/7aTM/lgId3wpFW5UwNJ0ImKknyT6oaiif4cMNwZehZ
	b2AHmBqQEgOjmnKgsKtDTXJwk6XfhcKiJ8irQa+CrB4jssC8Komz2wcfpZ8zpj0MBtWFC3GPVle
	nAbcdi0EhzwztbfbYgSj6dtZzYsGbPcNSruLOYBa7LqyzTjEWno9cEigBmayy+Es7NHRVFAO4eI
	Vt40qDmCQ/cpDehlF/XfcD6VMqTU2x3H1wCczR3cCD/BJ8+nf8mGT8+BQ0SuN6Ah3k8oPjBdK6h
	Qohp6CuG+912ZHfxOVbC7TQNTKjsEijAzBKKkV8i+r/4Q2DvsUWAu4LbqWwVCqkk27WySMl2duk
	5TLOUZlw6TFEcjWO6Q==
X-Received: by 2002:a05:7300:c88:b0:36d:7f5f:7e97 with SMTP id 5a478bee46e88-37967dd734emr19474818eec.40.1794924979189;
        Tue, 17 Nov 2026 06:16:19 -0800 (PST)
Received: from buffalo-ssd ([2a09:bac1:3b00:a18::2ff:99])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-380d5135221sm9540594eec.24.2026.11.17.06.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 06:16:18 -0800 (PST)
Date: Tue, 17 Nov 2026 23:16:25 +0900
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: mediatek: Remove undocumented, unapproved
 aliases
Message-ID: <avxXNp5xEbczbb1y@buffalo-ssd>
References: <20261117130556.234785-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117130556.234785-2-krzysztof.kozlowski@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_061620_809284_3154C489 
X-CRM114-Status: GOOD (  11.12  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Krzysztof,

On Tue, Nov 17, 2026 at 02:05:57PM +0100, Krzysztof Kozlowski wrote:
> The ovl, aal, color, dsi, gce, rdma, split and other aliases were never
> approved by Devicetree maintainers, because they were never documented
> as actual ABI.  Drop them, because no new custom aliases are allowed for
> years now.
> 
> This might break users of this undocumented ABI, so these should be
> updated to use only documented and approved ABI.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

You mentioned 64-bit MediaTek SoCs, but the same class of issues also
exists in 32-bit MediaTek SoCs under arch/arm/boot/dts/mediatek/.
For example, mt7623n.dtsi has rdma0/rdma1 aliases, while mt6589.dtsi,
mt8127.dtsi and mt8135.dtsi misuse "simple-bus" for the "clocks" node.

I hope this push for correctness doesn't lead to any regressions.

Best regards,
Akari

