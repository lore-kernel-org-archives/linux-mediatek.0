Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 257ADC61DBD
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2026 18:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cLhl7vMzATDfLTJ4Lrym/q2o4NDrnz3WBA6CQS/z/Wg=; b=Y4UMGsMnR6ojIVhE4pZTRaZ/wt
	1EJ2anO4/XHWvr0BPr9fd1s3rS9qzIOUBkzAwOFI7WNxgi/2r2RMB5nEjip2vxjJH8hSvz5xe+EKF
	QX6qJQ2mUWjP650xFADu7qKn1Zopq90VIopHYFMQw4pHKp+h+q/ALFCf0TdUywyg0ggvPKsLLDkRC
	ec/4RrW19HjUoy4bLcLDTgIiouIC4tfpGh8GxKAZQjqOpn6EBrjr/3xsFK4jl5gNMPIp80PyOdLmE
	njW8PvNNqg3F6q/wIXHeTK26TXNiQ7tk+LibqfURefZaxToYdLkIq6fTaVNze1cpnsr3SW5ccKJ1l
	SSaZLnew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyvrl-00000001JKR-2i12;
	Tue, 25 Aug 2026 18:27:21 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyvrj-00000001JJT-1TLU
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Aug 2026 18:27:20 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-39c74722e27so2131091fa.0
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Aug 2026 11:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787682437; x=1788287237; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cLhl7vMzATDfLTJ4Lrym/q2o4NDrnz3WBA6CQS/z/Wg=;
        b=r0udJLFJk+dzHaVUiWVMSL5c6fqcNO+rFiFe+5x+s1TGUB1+b4ZPzCQHF8wdg0IJh1
         3mLzYQeeRkikEzRXM0K+Lepqj8dlotRIk2UEh+2vpiPjn1GhmUfWdN44HX+usoPKqABS
         Bb7xnGl+b0JUdmoxeZBrekcmM/9veEo90jbHYBF4A4AfPzvnFM0KmSGkyCfV2QuBAekz
         Yq1bnDuyrjcu+zaz2fljPLXCA2d9JcMy8maJioUajse42RgGaGbTGW1XW08vQtArYu4w
         UCAOYfdqWnoBLFwnSylow3pS3aaPrjr0XU6h+PdmTq/JLnR10J1WmSh5McGNK0ed9JHG
         X9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787682437; x=1788287237;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cLhl7vMzATDfLTJ4Lrym/q2o4NDrnz3WBA6CQS/z/Wg=;
        b=LkPBN2rmVDKACorL3uqy1C2MoPD+HpXWRPNIsgiERJqHpNKvuvlgJHh+cTnU+K8cco
         fp2+SNkgjusS5Q1O5gyyOXx2fvIj/ERx6ag/NuRPvVWWOwwCd5r1lhXpk62aYEqULlnA
         TSROYSeCWWPW8mj2gXmOwPu5OnXT0hTOaZDZb63D630+6auvcAdlsJmziohyRwKLPANp
         8CZ5wNe6aEIXGSS9BB74JR88/Zjkgr84+9Kd0mTvAx8MsZ+CSJyAudUeQKdsW7RE0shx
         7D3mkb9Fhf3Pc+5YhKqwRkURQsL8KytAVX0NfpdI6RnX7KCvnajPrqP7524NZhowByYr
         TUJg==
X-Forwarded-Encrypted: i=1; AHgh+Ro9RTkfA6cP6dxLAeU4A6HbOEh654r4VGDqxBdqYEvAl6E/odS+FaFuoocTwDj6LVsHhXrQJ/nBlDF8Vwy3ow==@lists.infradead.org
X-Gm-Message-State: AFuF++lcuNIITjv/nNUsSUX4CdH2atRt1HMeG9fVR4WQWa9NZpq06tNr
	IvjicNI12yL6AJXQIB4q42/0FCHf8hSqwXvV/enqoRmn0FZ6Y0GTPDc+
X-Gm-Gg: AR+sD10bsEQ41rGaNb/axhM6ApCaAzdfB7n1sHI4QBo1Pxw6J/JBK80M3L0XY8AnRRX
	aYCzvbTHnvicnfPWCXPMq1Lfg+ziMU1PHR8E2u0Fz3NTf4bFzr7aYr8AEN2BF+Xu5O2KRJ8A8os
	KFHtpsynZ4CVexaRxD4GPEkWLT238Q78kxZ6/z/k2wMnnQraNkH3bS8Fdumpb5EFe4tHtm9aCQb
	PSIwbBFLCtCFdEnEcJ7gLD4qgBGg/IR4X9BopHKl3XH9326UDi/sw1hoPde4QeynSUXAzwSRpqe
	JQK4cpg6aYiZzgaNODiii0a3v4LnhOtPNiesDRMnH/gUdRUar3XvA6s/UtIqEO8Vxi9wfVf79E0
	DIbHhhbIBaO3+t+xxtKctSen0X5ypf+Kb4/KGmBXo+XrB2Nub06JhMt8Oq5ugEWiyDG6E9/X/8u
	yYdVhNupeQXvjhMD/2D5zfGjQDxsZbZyu/pAZtTW2i5A+HkHBcbNfbB5H8eFF+Z5G1lW7iiazX7
	Cw=
X-Received: by 2002:a05:651c:54a:b0:3a1:4530:fb2 with SMTP id 38308e7fff4ca-3a1edab181bmr15138391fa.5.1787682436763;
        Tue, 25 Aug 2026 11:27:16 -0700 (PDT)
Received: from localhost (soda.int.kasm.eu. [2001:678:a5c:1202:7b92:9ac1:b9ef:5287])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a1fd13a484sm393461fa.38.2026.08.25.11.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 11:27:16 -0700 (PDT)
Date: Tue, 25 Aug 2026 20:27:15 +0200
From: Klara Modin <klarasmodin@gmail.com>
To: Devin Wittmayer <lucid_duck@justthetip.ca>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Charlie-cy Wu <Charlie-cy.Wu@mediatek.com>, JB Tsai <jb.tsai@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-wireless@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [PATCH wireless] wifi: mt76: mt792x: fix NULL dereference in
 ACPI SAR init during probe
Message-ID: <ao3dyqWJ3nf3rMMW@soda.int.kasm.eu>
References: <20260825181712.28548-1-lucid_duck@justthetip.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825181712.28548-1-lucid_duck@justthetip.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_112719_419086_3358322C 
X-CRM114-Status: GOOD (  27.88  )
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

On 2026-08-25 11:17:12 -0700, Devin Wittmayer wrote:
> Some laptops carry a MediaTek power table in their firmware, and the
> driver reads it to set a transmit limit for each frequency range. It
> only fills in the ranges themselves when it registers the device.
> 
> The startup step that does this existed already, but it never programmed
> anything. These two commits made it run a regulatory update instead,
> which sets the limits on the way through, long before registration. So on
> a machine that has the table the driver reads through an empty pointer
> and the interface never appears:
> 
>   BUG: kernel NULL pointer dereference, address: 0000000000000004
>   RIP: 0010:mt792x_init_acpi_sar_power
>   Call Trace:
>    mt7921_set_tx_sar_pwr
>    mt7921_mcu_regd_update
>    mt7921_regd_update
>    mt7921_run_firmware
>    mt7921e_mcu_init
>    mt7921_init_work
> 
> Skip it when the ranges are missing. They are applied again once the
> device is up, which is where they came from before.
> 
> Reported-by: Klara Modin <klarasmodin@gmail.com>
> Closes: https://lore.kernel.org/linux-wireless/aoyxqHYvSuaBeubf@soda.int.kasm.eu/
> Fixes: 9b80bd9cab40 ("wifi: mt76: mt7921: add regulatory wiphy self manager support")
> Fixes: e9f3f1cc133f ("wifi: mt76: mt7925: add regulatory wiphy self manager support")
> Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
> ---
> 
> Reproduced on both chips before sending, an MT7922 and an MT7925, and the
> fix clears both. Neither machine here ships a vendor power table, so I
> supplied one through an ACPI override in the initrd. It also wants recent
> firmware. The June builds do not turn on self-managed regulatory and
> nothing happens; the builds now in linux-firmware do, and then it dies
> exactly as reported with no interface at all. Patched, both come up and
> scan normally, and the injected limits still show through in the power
> table afterwards, so the skip does not lose them.
> 
> With that table still in place and the fix absent, backing out the mt7921
> commit on its own also boots clean, so the table is not what causes this.
> 

Thanks for the quick fix!

Regards,
Tested-by: Klara Modin <klarasmodin@gmail.com>

>  drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c b/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
> index 946dd7956e4a..b468051fbe68 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
> @@ -323,7 +323,8 @@ int mt792x_init_acpi_sar_power(struct mt792x_phy *phy, bool set_default)
>  	const struct cfg80211_sar_capa *capa = phy->mt76->hw->wiphy->sar_capa;
>  	int i;
>  
> -	if (!phy->acpisar || !((struct mt792x_acpi_sar *)phy->acpisar)->dyn)
> +	if (!capa || !phy->acpisar ||
> +	    !((struct mt792x_acpi_sar *)phy->acpisar)->dyn)
>  		return 0;
>  
>  	/* When ACPI SAR enabled in HW, we should apply rules for .frp
> -- 
> 2.55.0
> 

