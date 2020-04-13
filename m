Return-Path: <SRS0=tzuU=55=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0910CC2BA2B
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Apr 2020 17:21:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D23C52072D
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Apr 2020 17:21:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WGnoIjb1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bVh1MHnI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D23C52072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aeztaTwzCekqWPnnCqijT4UYN0xDMJIY7bXhb8yTF7w=; b=WGnoIjb17z/TiF
	pYrqDUUnsKC+hqBGE/szXIT3KwPLayocLIN5+EHyxEH5Eqt4YVO1zBkzU+lBWhDmKyzty1StwPF6r
	oBuioKEPYQkwqZMEUsrF9kRCgMz8XorGWEUwN4WJ5Dcah4NxNPsFWNGgCyx3sp+6LJrm5zxFsBnT1
	ABnABbvjQwcKR/P6hQdVqj/ehY+tWrVOQws+Wtvlzbt1gQGIsTGZZOKAlXXXDoda4c9lEJgFJdtW7
	2b9DbeqE4iC/c7MdO2GUArqN9J5VDz9McvAqzZ4Z2KZudvOEzZK3CgSCTd4GU8tp0oVQktg2TiQa3
	EnGpLJ96UkYomdl0RITQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jO2lR-00078S-Jq; Mon, 13 Apr 2020 17:20:53 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jO2lO-00077v-Hh; Mon, 13 Apr 2020 17:20:51 +0000
Received: by mail-wr1-x441.google.com with SMTP id v5so10914504wrp.12;
 Mon, 13 Apr 2020 10:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kWgwtw6mnshP7OT2kiE97Ap+wsoZZptwcvaDrs1tDsI=;
 b=bVh1MHnIU7qEHoYKTXnX8K/41raLAhstyBAr9OgkIlaMU8CkeYDVbSuj2MVqY6E5dC
 qLA+7Z8aDDgXtfRRRqEt0JirV+9D3Kq0As4DptSjqE9XC0ru6jAEs0RursW6IqmT1Zig
 sI5edIfwkeSg6nTxBG35L3EVBdv/yJQ/xXc/2hlNlq1c87BhsJFy0UQbTYqwrCW9wi+m
 +UMcaGJA1UvnpJqFD/eQh1Kb4j9Rttzq1LN53LMaa6FQiRsPQtUzk7u8/c6uuQi/fWnZ
 FUJhWMCikBA3WxTFmBgTIrX+2cTVVd4s1z5j5ATbYWQ5BQnVkFcCL7dNGbK7P1nIsN/d
 axFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kWgwtw6mnshP7OT2kiE97Ap+wsoZZptwcvaDrs1tDsI=;
 b=Sj42/cuuzOrsCchr8KoE9AHz+vt00ezrPuAUTbC5rIoKsEIVuDOpcIOxsR0B1bJPzR
 w0kRj5RK/sP1DtqXsNBfWjjg9T29LGbSuMj1Kgna5PfOgWDF1j60tQUrOW/Z2FeQeek9
 rCZ9lATywpYKs000I/Knp7U1rYMayfdopkpgBQ+T+6LA7xggEK6mhQRUErtngFHWfxhv
 TvmmFcj5HqFBmbliYFyK5L5O8QenmuceHTHupxJqz8IR3IhvyqsLOSRRYOc3r9t8urk7
 V6iCcVhuRzq1aXkjNjEMc+fDZYuFA4U+II1SqWJVDUoyvif5poChNsuN+VRPAtAofJmM
 s+vA==
X-Gm-Message-State: AGi0PuZBRoPVuMq9ypgiLFzRWqiX6uMVquKbafKWcVFmVobHSazke9El
 bLd1ZJ2kk0VLE+mHrtUnCzE=
X-Google-Smtp-Source: APiQypIs6QMkRZ3InN+DdxIArcJcpkp8vBmkZ8YZyLT4LbLHkZc845IeZsR13A1TTF2jkLK0weALmQ==
X-Received: by 2002:a5d:698f:: with SMTP id g15mr5867707wru.135.1586798448730; 
 Mon, 13 Apr 2020 10:20:48 -0700 (PDT)
Received: from linux-gy6r.site ([213.195.113.243])
 by smtp.gmail.com with ESMTPSA id d13sm6835546wmb.39.2020.04.13.10.20.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Apr 2020 10:20:48 -0700 (PDT)
Subject: Re: [PATCH v7 5/5] media: mtk-mdp: Use correct aliases name
To: Hsin-Yi Wang <hsinyi@chromium.org>, linux-arm-kernel@lists.infradead.org
References: <20200210063523.133333-1-hsinyi@chromium.org>
 <20200210063523.133333-6-hsinyi@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
X-Pep-Version: 2.0
Message-ID: <7f08c5a8-8635-7e97-9585-601ac9c21ded@gmail.com>
Date: Mon, 13 Apr 2020 19:20:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200210063523.133333-6-hsinyi@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200413_102050_608787_96A07E5E 
X-CRM114-Status: GOOD (  16.45  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 2/10/20 7:35 AM, Hsin-Yi Wang wrote:
> aliases property name must include only lowercase and '-'. Fix in dts
> and driver.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> index 9afe8161a8c0..0c4788af78dd 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c

When resubmitting this, please make sure to use
scripts/get_maintainer.pl

The To and CC list are missing the relevant people and mailinglists,
porbably that's why you never got a response. The patch is trivial feel
free to add:

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> @@ -15,10 +15,10 @@
>  
>  
>  static const char * const mtk_mdp_comp_stem[MTK_MDP_COMP_TYPE_MAX] = {
> -	"mdp_rdma",
> -	"mdp_rsz",
> -	"mdp_wdma",
> -	"mdp_wrot",
> +	"mdp-rdma",
> +	"mdp-rsz",
> +	"mdp-wdma",
> +	"mdp-wrot",
>  };
>  
>  struct mtk_mdp_comp_match {
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
