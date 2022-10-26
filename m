Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B810FC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Oct 2022 07:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lbsIGfNdTRFI62Q4sgMBIvZMA5h+sOP1oBKSZ5ur8sg=; b=J9xYiMfvIJ5dwL+DYbdCBlB5W+
	hoH1nYF65HMf23QgnzZfb+VcxKqn2OIQxwK38o1Z59t0F9Nsb9l2andGRtZuISsBS02OObehUUufI
	iP41PdqRlOECfAPhxCv7fae191h48HVzX7obS24LV5TyrIwaoWXnC4KKWcp1HlWT7HwBiXAaYCFuF
	uKguKnOaFhZ9kFZGElcYP1OFosuRGL3+m/xP92/l0DzQN7WQPTSeswrcA+AnDHAaxVPjIQa0BUzDl
	ZKCf8NFz87MxXZP9fC0yriY2ankFrdQzcmz0e/jTmcDGw6RnQeJ+yLE/DOoclvm+u4rnA4vLltH+y
	aSzvj7sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onaml-008OBr-7z; Wed, 26 Oct 2022 07:25:11 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onamX-008OAe-Fl; Wed, 26 Oct 2022 07:25:01 +0000
Received: by mail-pg1-x534.google.com with SMTP id f193so14040852pgc.0;
        Wed, 26 Oct 2022 00:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lbsIGfNdTRFI62Q4sgMBIvZMA5h+sOP1oBKSZ5ur8sg=;
        b=pNtYy80rJqYM08OpI1tcWHi5BJehiegmf/3b81VbZwJFYi2J0V6LxLfOBGST56LYDB
         yf1ZpcpCQWBINhlBqut6Pvft6+UgM0QGpgp3iqsdQAwlqXp2HAvFZaF3o0LhZBHFSxZv
         4PMwaXRB/4bpixQJ60oJCAuwuAUFiYmo8hdpBb6EmbOgagTt/fpVMy2VPJ4zRogsrSem
         xq/Ey8C89WgWQI+ErYXv2Bgxjx/SjfLjN4imGQ0rdOnXLrZLjOPmEGYFqOWxIHP2MmFZ
         Yor9FM03SpqhhFBFhNr2YsV+pnZZg/3msxAEwEX9wQuod/l4ifb/UHSXDELucDE0xIno
         NptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lbsIGfNdTRFI62Q4sgMBIvZMA5h+sOP1oBKSZ5ur8sg=;
        b=sHKweDrOFs7AkdXX0njD2xyq4y2EZ+GOV6aNce/EvTRLLLDJ1++u6x0bjrcbk1Xagx
         C/Z2tyAdm5rBMwpm9PdEadvm8FWRkE+pFGA7UZ8j428u7RxhaEmR9H4/Tz23jz+8dcfb
         Kml9qiCW2snNUf/aUtJ/FzXV2YIalWK3Ce63jqlXX+mAKY5bdQNWZoMJycRypaIlC4fU
         BR6PbBIGt5CB+nOxlc64ns4FrwcyDOMlegOz+d5QXt2hIaqEyK/wBt97+XaYBno+1wOJ
         HlhKHjd2OWJ3m1ApuJvG4qgf2ZUGvaSAnBfHciLKkyPvwd8YPHls3/zU+qEY1j/tBQna
         jb0w==
X-Gm-Message-State: ACrzQf1S8ccfWeVWkHtJuf5dcSt3voVnBlQQkfV5BWHRUe3MwG54mRGa
	qqvSPbp3FRLfk2xk0nNjwmCW1WGQ/nQ=
X-Google-Smtp-Source: AMsMyM5Pgl8UXjLTT+IynrpLOReb8fQxrJOCS430MlGcU+ORFvzAO1lF4PZ8RLhm+3ZNVYQprM6ROw==
X-Received: by 2002:a63:1a45:0:b0:439:49b4:9672 with SMTP id a5-20020a631a45000000b0043949b49672mr36078100pgm.551.1666769095629;
        Wed, 26 Oct 2022 00:24:55 -0700 (PDT)
Received: from cyhuang-hp-elitebook-840-g3.rt ([2402:7500:47a:8591:4c25:2ac0:9173:656f])
        by smtp.gmail.com with ESMTPSA id k22-20020a63d116000000b00469e09532e0sm2252228pgg.18.2022.10.26.00.24.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Oct 2022 00:24:55 -0700 (PDT)
Date: Wed, 26 Oct 2022 15:24:48 +0800
From: ChiYuan Huang <u0084500@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Lee Jones <lee@kernel.org>, ChiYuan Huang <cy_huang@richtek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	ChiaEn Wu <chiaen_wu@richtek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH resend] mfd: mt6370: add bounds checking to
 regmap_read/write functions
Message-ID: <20221026072444.GA24881@cyhuang-hp-elitebook-840-g3.rt>
References: <Y1aCiReTZDbPp/rS@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1aCiReTZDbPp/rS@kadam>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221026_002457_563651_A9791F1F 
X-CRM114-Status: GOOD (  28.91  )
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

On Mon, Oct 24, 2022 at 03:18:17PM +0300, Dan Carpenter wrote:
> It looks like there are a potential out of bounds accesses in the
> read/write() functions.  Also can "len" be negative?  Let's check for
> that too.
> 
> Fixes: ab9905c5e38e ("mfd: mt6370: Add MediaTek MT6370 support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> This came from static analysis, but then I couldn't figure out the next
> day if it was actually required or not so we dropped it.  But then
> ChiYuan Huang did some testing and it was required.
> 
> There was some debate around various style questions but honestly I'm
> pretty happy with the style the way I wrote it.  I've written a long
> blog on why "unsigned int" is good at the user space boundary but should
> not be the default choice as a stack variable.
> 
> https://staticthinking.wordpress.com/2022/06/01/unsigned-int-i-is-stupid/
> 
> The other style issue was wether to use ARRAY_SIZE() or MT6370_MAX_I2C
> and I just think ARRAY_SIZE() is more obvious to the reader.
> 
Hi,

Before applying the patch, the test result is like as below
1) overbound register access
Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
pc : i2c_smbus_xfer+0x58/0x120
lr : i2c_smbus_read_i2c_block_data+0x74/0xc0
Call trace:
 i2c_smbus_xfer+0x58/0x120
 i2c_smbus_read_i2c_block_data+0x74/0xc0
 mt6370_regmap_read+0x40/0x60 [mt6370]
 _regmap_raw_read+0xe4/0x278
 regmap_raw_read+0xec/0x240a

2) normal register access with negative length
Unable to handle kernel paging request at virtual address ffffffc009cefff2
pc : __memcpy+0x1dc/0x260
lr : _regmap_raw_write_impl+0x6d4/0x828
Call trace:
 __memcpy+0x1dc/0x260
 _regmap_raw_write+0xb4/0x130a
 regmap_raw_write+0x74/0xb0


After applying the patch, the first case is cleared.
But for the case 2, the root cause is not the mt6370_regmap_write() size
check. It's in __memcpy() before mt6370_regmap_write().

I'm wondering 'is it reasonable to give the negative value as the size?'


>  drivers/mfd/mt6370.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/mfd/mt6370.c b/drivers/mfd/mt6370.c
> index cf19cce2fdc0..fd5e1d6a0272 100644
> --- a/drivers/mfd/mt6370.c
> +++ b/drivers/mfd/mt6370.c
> @@ -190,6 +190,9 @@ static int mt6370_regmap_read(void *context, const void *reg_buf,
>  	bank_idx = u8_buf[0];
>  	bank_addr = u8_buf[1];
>  
> +	if (bank_idx >= ARRAY_SIZE(info->i2c))
> +		return -EINVAL;
> +
>  	ret = i2c_smbus_read_i2c_block_data(info->i2c[bank_idx], bank_addr,
>  					    val_size, val_buf);
>  	if (ret < 0)
> @@ -211,6 +214,9 @@ static int mt6370_regmap_write(void *context, const void *data, size_t count)
>  	bank_idx = u8_buf[0];
>  	bank_addr = u8_buf[1];
>  
> +	if (len < 0 || bank_idx >= ARRAY_SIZE(info->i2c))
> +		return -EINVAL;
> +
>  	return i2c_smbus_write_i2c_block_data(info->i2c[bank_idx], bank_addr,
>  					      len, data + MT6370_MAX_ADDRLEN);
>  }
> -- 
> 2.35.1

