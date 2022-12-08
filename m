Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05760C10F1B
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Dec 2022 23:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AbgxOMwpjewhzmMSPJ3VcRbgZTT1KK9NxNUKJUyOYKM=; b=W94AMSjZH4N4Tcy1pp7AczS858
	H5jdzIS9eFFUx2hoaDAgIprrJ5Qel8AZjxO7R2LZ0/4iT9wL3aAFjwK+Ck84UrJJ5SDEekyhG649Y
	wGQ+yEKkWQsnpvq6X0R4gA9QvMLxxU8IHH3ztoXlDbYLkLYltcBVveQiNtDWXB3P/UuOHwdNHRanM
	/62r0+rMyKlF+9xxczbTsc9XJYTQ4D1Xu3JTUuhRPfaLM8dZRy7po3Yv8ZTC1yKurP9Z28XCkiOjG
	1Sn9tZPQ2rpV4oIUgafQ8j8dNrLCu4Qg7QBy+q/Ib6bztSP8Q+OWOxOXObWl10fIMfxojZkULiG3l
	YaBrdGig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Q6d-00EuIH-4v; Thu, 08 Dec 2022 23:15:07 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Q6a-00EuDq-Eu
	for linux-mediatek@lists.infradead.org; Thu, 08 Dec 2022 23:15:05 +0000
Received: by mail-qv1-xf29.google.com with SMTP id q10so2017164qvt.10
        for <linux-mediatek@lists.infradead.org>; Thu, 08 Dec 2022 15:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AbgxOMwpjewhzmMSPJ3VcRbgZTT1KK9NxNUKJUyOYKM=;
        b=OiP/aROy/idYv+3qg51kzjb4Rq+HT40ZCTJbUOWaFG2W/WrdTxLAZlrVzWkY5gC928
         qrJB6HMf8GTbqFIMnMGSvI9MM54HCjh1dFTaTB2iTbjFX/CvMBi5//nc8ssOtkAPynMX
         nIlY9BxFYsuarZRWkOQterBiJ44ZonAg8vE+2H4hEA9j/IIKKScXctfYNPOsnEk899NX
         OSaXC9C/iLwDppdzxDxFWbjscwz/6ugERxs5Efo4b4vMO0wbYCAHrEKjKa+M5rZvruXc
         QGUIIQ0HWeh0+nJUOl1bKhyUbdb5gFNH9CXzj+gaObf7Wstu+MOggAE2WdBnOUm9XNQu
         I6/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AbgxOMwpjewhzmMSPJ3VcRbgZTT1KK9NxNUKJUyOYKM=;
        b=Ou6g8Yj+4ZAL+vObKSieUSghJ2XYhuxYbO2i0vtabbrkXB7ABxevlsj1HhkDmbLaxZ
         kFwE0jlKzjzGIk15+YupCczQJ2+Zbac7rbnjN51AY3Njb76uzMGNLp7pgrO29ejH1HKa
         gYvHSMWf1e8ViYYCOJdE7VXMzdfUs+GRK3NVUPRUwZUtAC2O85gEvEkxyXLskt8oJ0uY
         dOy1VLzimtMdkXavazSLi+e1PCmH/HX2atw/TjLrk6WEBd795OQAJMx2DtBnxV3OC3yl
         8/erYsbyRjXe6CN4YJOXPXNvxptiie2FiTzgD6ea6ZAoZ1j5g8mA04Jlbe6OstvKk5pQ
         Nk2Q==
X-Gm-Message-State: ANoB5pnfYbDQ1pkEi7JlHQ3ySD0uTsxqW1o5WoGeYpL7Gw4UNc9rulxg
	NMQBTTqAhnVcJrjTWRUj4TmeDk7+eyx3CYVwiII=
X-Google-Smtp-Source: AA0mqf40Ch8Q8KacZrCKsvpVF7J+Jye6OvmlIgvk0BSMsMkN9rtdQpfKE89qMxkpPTwdGh9SVIlTeKWRhpEqXEoAenE=
X-Received: by 2002:a05:6214:519:b0:4c7:6210:8d8b with SMTP id
 px25-20020a056214051900b004c762108d8bmr16684366qvb.119.1670541301732; Thu, 08
 Dec 2022 15:15:01 -0800 (PST)
MIME-Version: 1.0
References: <20221208160137.3855-1-shayne.chen@mediatek.com>
In-Reply-To: <20221208160137.3855-1-shayne.chen@mediatek.com>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Fri, 9 Dec 2022 10:14:50 +1100
Message-ID: <CAGRGNgWvT7e5DkTO96PaMazDae-wTe3ctBx8-n6EGhYxFPwCHQ@mail.gmail.com>
Subject: Re: [PATCH] wifi: mt76: mt7915: add chip id condition in mt7915_check_eeprom()
To: Shayne Chen <shayne.chen@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>, linux-wireless <linux-wireless@vger.kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Evelyn Tsai <evelyn.tsai@mediatek.com>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_151504_541242_4307C59A 
X-CRM114-Status: GOOD (  18.15  )
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

Hi Shayne,

On Fri, Dec 9, 2022 at 3:06 AM Shayne Chen <shayne.chen@mediatek.com> wrote:
>
> When flash mode is enabled, and the eeprom data in the flash is not for
> the current chipset, it'll still be checked valid, and the default
> eeprom bin won't be loaded.
> (e.g., mt7915 NIC inserted with mt7916 eeprom data in the flash.)
>
> Fix this kind of case by adding chip id into consideration in
> mt7915_check_eeprom().
>
> Reported-by: Cheng-Ji Li <cheng-ji.li@mediatek.com>
> Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
> index 59069fb86414..e21aa03c85b1 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
> @@ -33,14 +33,12 @@ static int mt7915_check_eeprom(struct mt7915_dev *dev)
>         u8 *eeprom = dev->mt76.eeprom.data;
>         u16 val = get_unaligned_le16(eeprom);
>
> -       switch (val) {
> -       case 0x7915:
> -       case 0x7916:
> -       case 0x7986:
> +       if ((is_mt7915(&dev->mt76) && val == 0x7915) ||
> +           (is_mt7916(&dev->mt76) && val == 0x7916) ||
> +           (is_mt7986(&dev->mt76) && val == 0x7986))
>                 return 0;
> -       default:
> -               return -EINVAL;
> -       }
> +
> +       return -EINVAL;

If this returned a bool, you could write this as:

switch (val) {
        case 0x7915:
                return is_mt7915(&dev->mt76);
}

Thanks,

-- 
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/

