Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E5FCD5BD2
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 May 2026 01:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uN5DfBzCdxgMtcbb6Yn1Crv8Mos2ktrmL1d0GO1AHx0=; b=bmwMc4ia0evcgo+YFOG/dDbKP4
	jsk3wNjyW2CDwK+6dVgQNO8a+uPJepc7kd1X/I5jSz906eATAHvpwCr2+JHbfh9dfESM/TVlxcaLr
	WdQFoQsYuC+n1eTu1vztTaMsfQ64FQAOq3CPAeUVenpi0VwCMkfJGfnWZQPVjdXKhrNJVGrMFRXcI
	M26Ju9uxjPTDNtT1An/ErOuTFUpW8zP1vjiVVjMx7vioWvTuRRcv6Q5bl/55YHq7e4gGIAEqCrQTK
	eslSDj01Z1uGXxclpxx0OuwwbKlnYdfU+xnQCFhPUf5pd4Ys84hu7y/RVzBfWgIe/Ag8Cgi/UOIU6
	rkTa9HZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS3HA-000000038LG-338W;
	Wed, 27 May 2026 01:41:40 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS3H8-000000038KM-0zfi
	for linux-mediatek@lists.infradead.org;
	Wed, 27 May 2026 01:41:39 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-2ee990e8597so26612758eec.1
        for <linux-mediatek@lists.infradead.org>; Tue, 26 May 2026 18:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779846097; x=1780450897; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uN5DfBzCdxgMtcbb6Yn1Crv8Mos2ktrmL1d0GO1AHx0=;
        b=lhJ8yx5wuxIEbh3Z420v2Js8mLc6UVzhhOlXJJqM5gUmZvNXhzuCDFoeWjj2XJKFH5
         ix1oD85w2Vn+CiwDRFKzyzMsokKEI281GHBERLTdqwICX10xiqOZ1CHNVv7i+lGjYGOy
         +VDINDwhKgJa5yMaYNwwyC/U8cNNnb2FQxDI19Pf5k9eX2mypDz44j7VJ5W24GeeDZwB
         JQyK7ZKEdtOa4mFL2Q0snHxE1yV+OFv6E6wOeBlYdC1f/euShypHfGAMtDrbThsnyxt/
         PU7GFU/iFfKBdala8MC5LMZ1SYMfcT9IBw2doWDN5BGMsDDl5tzWkPjHw+AiKb2xCTSv
         L92w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779846097; x=1780450897;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uN5DfBzCdxgMtcbb6Yn1Crv8Mos2ktrmL1d0GO1AHx0=;
        b=HF2PvywIvlXNNsl2UIxraSN+0K2vvJcxRTTvJOSNQp3HW2mK4FhuX1Bf8Lz9Ffskb/
         +2rhs8VhW7k/jHeOshPrjoSY4+mbFLF47ljaFo+EQIaZpEjy03htTOZSWarhQQ2t5w0I
         1YCxj9nDf/FJTAckClhnqV36S+YLaKy0Rz9yfT8JQZ73KhGHn7k23gtAVsHN1S6wXHgV
         SlyhC27AKcw89NTF6sNXHR9Bs7I0BWYWjNttRW/thuvaD3MC2Bp/YFSHNxJdEGoOHNJI
         ExiOIpeqxZZvsZ7MLkTBBLYNSL8P+n0Umx2bpIF0CW7kJFlP6NQcgCMYuxxCXVc6m+On
         PiMw==
X-Forwarded-Encrypted: i=1; AFNElJ+ZftGOKWAUMYBqqWQ+yn3Cy6m2+rnVf6X01ffD0kozRsq6jRnhuoJ1VUT58Z/G/J6LqmNeQKYBH4V56aUX8A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyGCciD71Sb+4Gb5QLdswcy6mqC4sMIqGE2KRb9nbAvxRZEPg2J
	y1Z5oSYBr+O4wwjjmifchZrmZqSgh1r04y4xP8m3sW3etyUQ8LEL5pgF
X-Gm-Gg: Acq92OEr/D5e1A23R9g0gPxKPYMYCpBeSuEftF9hVMA+Qjv+CPmoKTLjkjUZ1PrzKcU
	nXu8cf+06bSVQBLAC4C1pTN6t3OV3bZO3TCuth1oU9v8bWTZKiRV1oHqyscGKiUp7c+XoeRtm+7
	vW+FezBO+CRbwjO/paeCQNb8LmLiVfnpOPy+5MQUzjFVP6E+h/1v9EN41wg4Jq6xVGRDp8e4J4y
	MwRWuh/kCu4c249JXv6aQ15UkWRDG1ysxqVYJK/5bvw0hecRnoa9vobtRQZ8LKk1aEkI0s/VCf2
	Zdz+RqH4ayyLLGm2spJuNwp6NGgLeNJCKbYEbZyMuwup84YnbkjYRCeP6lv7DMnqreoIYT4cFd7
	LNQCDUkmRj3mggkHTkNjw9lohOgGr+1Oj4WexSWK26DW1dfrYYvLgH+v5hnh07yzH7mq4D2Umbg
	V3NW75sLfvPkoZcBa+F6H6GEWAR06g1OyBBUsAPQpCmgQdQ2XlRzBnLm6JxMdQtX0wMn4gBFE/O
	Jg=
X-Received: by 2002:a05:7300:4305:b0:2ef:1d11:18ae with SMTP id 5a478bee46e88-3044912c25amr9993942eec.28.1779846096801;
        Tue, 26 May 2026 18:41:36 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:912f:eb49:d713:7401])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304a57c04f8sm3258965eec.11.2026.05.26.18.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 18:41:36 -0700 (PDT)
Date: Tue, 26 May 2026 18:41:33 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-input@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] Input: mtk-pmic-keys - match loop with count
Message-ID: <ahZJ2Opc2K7WLZKF@google.com>
References: <20260527004543.22875-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260527004543.22875-1-rosenp@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_184138_312097_EB3463F6 
X-CRM114-Status: GOOD (  19.96  )
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

Hi Rosen,

On Tue, May 26, 2026 at 05:45:43PM -0700, Rosen Penev wrote:
> of_get_available_child_count is used along with
> for_each_child_of_node_scoped, which can cause a mismatch when keys have
> a disabled status.
> 
> If a disabled child node exists in the device tree alongside available ones,
> the loop could execute more times than the initial validation accounted for.
> This might increment the index variable past the allocated array bounds,
> leading to out-of-bounds accesses on irqnames[] and keys->keys[].
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/input/keyboard/mtk-pmic-keys.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
> index c78d9f6d97c4..5d4ebbafd276 100644
> --- a/drivers/input/keyboard/mtk-pmic-keys.c
> +++ b/drivers/input/keyboard/mtk-pmic-keys.c
> @@ -363,7 +363,7 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
>  		return -EINVAL;
>  	}
>  
> -	for_each_child_of_node_scoped(node, child) {
> +	for_each_available_child_of_node_scoped(node, child) {
>  		keys->keys[index].regs = &mtk_pmic_regs->keys_regs[index];
>  
>  		keys->keys[index].irq =

I think Sashiko correctly points out that this may result in incorrect
register data and interrupts being mapped to the keys (potentially
shifting them).

Maybe we should stop counting nodes separately, iterate over all of them
here and bail out with an error if we encounter more than 2 (does not
matter if they are marked available or not), and then skip not available
nodes? WDYT?

Thanks.

-- 
Dmitry

