Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B76C7C61DB9
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Aug 2026 09:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5S6aFJy+mT5uKBC0KX5FwDzSqvoGmSboVBAKwD0uv/s=; b=14pSP+4bMA8Zt/Xd5GGv4cJTGx
	3gNFbcp+xj/jMKG03jInuYdc73laqV2mCXtKlcLbAIanHCrPbcHbSiu8W4dVgEbfhJqDIRojHNmaS
	DaB9UQkgGjlFL2/z1L3GDBsc3rd2ah185ts3P19mrKCq6j0f2e2PTi8hkgPXfttDlkHWxVGXAyQyT
	LBwyAwFngOxzRv2SfYOmHiLYpCyCkj3TBH03+qLPXpLPYzU2nHRYH5xT+aM6U4zMREU4+K9APFaCL
	QaPBuiJuIoeihVwFUkSIVvFttAU4PMmqtzsctySMnJErrroEPrEhXcID04zAV0HH4Ybnhmwhi8MAu
	OUTdMHrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0cEO-00000007dRR-1rog;
	Sun, 30 Aug 2026 09:53:40 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0cEL-00000007dQp-1VcY
	for linux-mediatek@lists.infradead.org;
	Sun, 30 Aug 2026 09:53:38 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-52fac937235so155391cf.1
        for <linux-mediatek@lists.infradead.org>; Sun, 30 Aug 2026 02:53:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788083615; cv=none;
        d=google.com; s=arc-20260327;
        b=KMg7VEU6jEETDRKXVhZEJudbvHE278uVa5epzAYKCK3XR8s27qDZSMuES6DDrVgQt9
         IGFlG/x5J5yVM2eR/ZLwco8s51fz1rKmqkNhc08R+eydo6daZrXtmvlh6MQ5qtl/QxAU
         VLL9d+BHKNoWmZHqGSjPWt9JL1YU82fnCJSwzVGcsutC2rlN87xBVybpISsUG8k433nZ
         1S5eKqZ4ExnfLP2xm8nEvdBchOXArr4K5LR4S490mHkTAgDzltT8EhdCG8+WQYjeF60W
         6H8bycGx50ZmCgmV/ZqychDs7P3vc2zw6n7wsOKbi4Bk//HAcNERNH9lc0PxOYrHUjdy
         O3mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5S6aFJy+mT5uKBC0KX5FwDzSqvoGmSboVBAKwD0uv/s=;
        fh=gsrke41R+8i1C+699dzkpPJ746mAWglCbswTFzAyLFw=;
        b=aqHT/bW5FZCTs9tsBOZtv1qRey0W0APqj5tge4fzcwZQJgTbAM81sfsAH+HfxSMw8r
         L4pyikodk5Vbz4iWRJrZuHdi4p+lCNzHpDv34PDw9jGRP5UPfMXhnXGj/D1bP19x2m45
         xzUEo4q5GAoaRiv/38AT5AgyCa8M7MjWxqUnFe2qopKyxWjyKKkIe3fr2BT7NjJj8tow
         o/kFmVQa4SvB8EgPXoE1f12OiCo0JJS1UseMaU+FlBfz5yVkLS/fAnpuPmn/UpYo5xpV
         ZnwcgeHFVg3oNdO39gXzZGMlqZOjdrAiM848+TksHvFkuDsbldo+lOyFIXBJ+GpWt8Bh
         NiKg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788083615; x=1788688415; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5S6aFJy+mT5uKBC0KX5FwDzSqvoGmSboVBAKwD0uv/s=;
        b=HCl+eOy/9riRH/QkSAg+9rn1chGjByuFAycqqnHvpUUgu/xoyEgPsNGbvXBxzyPzSn
         ALS5S+2auYTURn9siGwhFfKPo9rLAIyS500xH0ypliBKqpmvifMZRLTDJmbPHNXUYKIh
         pahkBvklvnH6ssj6A1MyYFaatdiuFxQeNx1D5VlAKEccIRDQfBGMhHr1htHwcByRSfVX
         1lcnhUqKqEgVxlAdVBM2CETyaED9/Y7UDQL8qUQAVkVYVomW0FbuPTfGUfx6twZRaTxM
         gkKow6hOJpFRVsK563a2PyTY5v8SGt2JWAaVkmiZEgT1ccTSViX+XGOMZ5ekn+Pu8aTP
         inMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788083615; x=1788688415;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5S6aFJy+mT5uKBC0KX5FwDzSqvoGmSboVBAKwD0uv/s=;
        b=liNJltpVyg6c01SACMubwoZcJLxYP+5eU+MJOdvV6ZfIygi3TKkAPr/oY32M6lF8nU
         sXBR4OSEKu9NTYNdCCGygq6/Clj2lpJRXVUX4OG0DJ7w6lNrNFJzGn1Q8eas3FjPjKTI
         jhMLtokkU8JvUDa38z0WZUlH2VTffdltYlvGHktd2zy8S0ZXS3gqY2x6NEIwfL4JJZzm
         Oy/CSvqTTi1ktwwtuahs2PbsCxTb8HEisPzswSPTn9iAD0j3oLSM4P6rALgMAjTMu3t/
         1KP2muiMzfdxeXIPQuPscsHcN5qtvJp12k0qRxoy1IYEQUCgmGw17AY8OtMRDe2KjNrq
         JgvQ==
X-Forwarded-Encrypted: i=1; AHgh+RqsWqSb7KUa+tuMt77VHdb/en6ukVeJYS8BvSN0e4N6nQDleVGI3J9cwYZ936LQvqjUQhaFlVnfT6HaEsUzGQ==@lists.infradead.org
X-Gm-Message-State: AFuF++mJB7waLy6Mu3txSnXZnnFSlmtRLqzAgEqCU9578qdz5DMEldu7
	ku8sBMt+x7LJaKE4gXpX47XJLZN5+eR7BvnbHD4xJojyjCu+HbIka10OsxgywkBuzwJgOtOtTeT
	uML3EINythsnAzyrPTs9c7qGqOiyWTa6TNc46MkV6
X-Gm-Gg: AR+sD12q+9FJDX6MCTTS1H6tLYHClXcVoZk1Ivz7E0ee3imuroHR4D/HSbU98kv0bXo
	/HfJv0vgqXQjIsNfTHteh0mjrPiaM0TSm7WemLrvK14KDGKL/Mrl5xTSiMi+Kjy/Ka1d4BY/hBW
	iw8X4n1vXFTYbkttqwbHWQSLhgoaTHcV6lfWEqH6P3HHxngTpuFcU0VvwPEe71rODmK4QI7jxkz
	LsPjQ+wyg1v2rh/3W696yTCBmMVRalth7h1zjYoyQw4gYSHz9IbSNiJdex7eUfIlAJeOMeSqKR9
	6eVNlmpj1pHuthavP4GFYiIGu+puPNsOfcslEtTK8cI3acNJvI6RvJr6ZKprC4P5t2N2gutXUPi
	gNA==
X-Received: by 2002:a05:622a:190a:b0:528:38d6:71b4 with SMTP id
 d75a77b69052e-530100f6b84mr249421cf.11.1788083614253; Sun, 30 Aug 2026
 02:53:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260828092311.10774-1-pengpeng@iscas.ac.cn>
In-Reply-To: <20260828092311.10774-1-pengpeng@iscas.ac.cn>
From: Stanley Jhu <stanleyjhu@google.com>
Date: Sun, 30 Aug 2026 17:52:57 +0800
X-Gm-Features: AcwNN1UaiSHb4F9fUpqjBR1le5QyODKMu5bAeRX35ytqP7PxUTTdcqYqoVRCkRc
Message-ID: <CAE14pdeXt63__PW0Md6Vp4hfh-HTdhG=LGSRtYRLQKWk0phxew@mail.gmail.com>
Subject: Re: [PATCH] scsi: ufs: mediatek: Handle mPHY power-on failures
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, Peter Wang <peter.wang@mediatek.com>, 
	Chaotian Jing <chaotian.jing@mediatek.com>
Cc: Stanley Jhu <chu.stanley@gmail.com>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K . Petersen" <martin.petersen@oracle.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-scsi@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_025337_570832_8384E519 
X-CRM114-Status: UNSURE (   9.28  )
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

On Fri, 28 Aug 2026 17:23:11 +0800, Pengpeng Hou wrote:
> @@ -509,6 +509,7 @@ static int ufs_mtk_mphy_power_on(struct ufs_hba *hba, bool on)
>       struct ufs_mtk_host *host = ufshcd_get_variant(hba);
>       struct phy *mphy = host->mphy;
>       struct arm_smccc_res res;
> +     int rollback_ret;
>       int ret = 0;

`rollback_ret` feels overly verbose; a shorter name like `err` would be
cleaner.

> +             ret = phy_power_on(mphy);
> +             if (ret) {
> +                     if (ufs_mtk_is_va09_supported(hba)) {
> +                             ufs_mtk_va09_pwr_ctrl(res, 0);
> +                             rollback_ret = regulator_disable(host->reg_va09);
> +                             if (rollback_ret)
> +                                     dev_warn(hba->dev, "failed to disable va09 after mphy failure: %d\n",
> +                                              rollback_ret);
> +                     }
> +                     dev_info(hba->dev, "failed to enable mphy: %d\n", ret);
> +                     return ret;
> +             }

`dev_info()` is inappropriate for an operation failure; please use `dev_err()`
instead.

Thanks,
Stanley Jhu

