Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BE0606A32C
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 23:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jHPgQk2Y;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=htrT8TXc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:From:
	Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MNWlDqY5Q61g7lNZmof1nMmtIa+WfJ4+kLyYstNyQbg=; b=jHPgQk2YD9otfdDr302VOUiqel
	q/Llzc38TAKBN9OJn2b+GAtLfUf8oiKyyLYeRbQdlTotaWp+LFlg6VaKR3oM6BP0VLSi/pQO11aho
	8YoAxa6Q7MPhMT7Uw0ia4yOmgZIQR28BJv4fElfd7gne9IbmQwW/7HxSQRT0sPnR3q5y0P52fJYYh
	dXwmbmSTlpuzEDWhuu8wxDcZYvn98Ki50eLXAime+fzzvCIfxiksuZenevQi2K1cAXyH2Ilvsn4jR
	2n7iVyRnfjV/7CpNOkQzdUF032yli2HDNdbHQK80NgFloUjb6YPWYuOg6IoJqmY+fWSCuM2r5dh0k
	jI7F45CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVdPC-00000005A62-1ZKx;
	Mon, 23 Nov 2026 23:25:02 +0000
Received: from mail-dl1-x1229.google.com ([2607:f8b0:4864:20::1229])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVdP9-00000005A4k-2FoI
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Nov 2026 23:25:01 +0000
Received: by mail-dl1-x1229.google.com with SMTP id a92af1059eb24-1b244fb7fffso3587833c88.1
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Nov 2026 15:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795476299; x=1796081099; darn=lists.infradead.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MNWlDqY5Q61g7lNZmof1nMmtIa+WfJ4+kLyYstNyQbg=;
        b=htrT8TXc+RbqH4+5HMQjlgQiRU/aPRUERBRpsfaUeNxpzzjohJa6QEzmu3807pxw2m
         JZrNDvTB7gfk4V7N7L2fNZoXTgvRi/V9o2TifdUQsh7ofhatqUZR5NLsqwkzJuZwkvL6
         ys2bgYLM7tzTYWsfmZOL0kZTFnUxdGst+cUqSWIsNU7Xf9bivv8C7+8O1Nl3FG1nZQ3b
         x/uXSZNJjeMz2FgmEz8vVdCt8grFuxlzKFaiQWfjB7t4YVYVQ8DUdC778wjuwJHUxKTN
         IlxpQiq8SaFpt9bJi6NguZDukNvHwZg5U1Y9CLWxlNCa3qLtzVt22tDdf3GTC/x98Wlx
         tniw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795476299; x=1796081099;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MNWlDqY5Q61g7lNZmof1nMmtIa+WfJ4+kLyYstNyQbg=;
        b=UqEBWMJx7JFdWcADOgJN/cQXI5nSY54kmmZmXmINiok6FVYXWbp6U5QUewx6at5q5e
         EzXR8hH8+pkfAjcYrRf2owMkUytO8rFHAtKMca/1UwpeVn90T/vzBBl6ku8Qp4l8FjlD
         fy9GDUJ7NCFI3S5NVNvZ3YHHqzbmDkV3FxG9NQC76jK10LrfEE+SKU67bAya+F3C1YGX
         7vV1C4JtwuATgKoBk16glhuOmNkJknRgIe54Sc2eyqEa7j4BM5mkqSbSLZCY1lDGbiVD
         tAY9NMYtxg57Qr6XnmdR0eadO7GNTpWHzn8F0W/lbg7N3jvJ4WpVkjcefCPYwNdkciwU
         ODaA==
X-Forwarded-Encrypted: i=1; AL+hErHpfQWVL0qNJQFdfBqHoZ2y6fcAt4OBAXNKwVaEt/IHnRuqx12aNzsTwTp2ps/hifwnubglR+l7EvHE1i/jGQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z92lppSnD5W+OJlfKKCU+jyb8/OVKbGCmLTskf5m8mLgvu+VpZj
	txYeJh8hcv2jUXNDE2TTjGfq/qO5ueS281QqspGMASEXXEX44AUB/jxg
X-Gm-Gg: AZFdTZckfE0+Gw/sd+1tYJHHFHHNRTqrvqH18j2Tq3iPvAN+9gYo6Iu0eh1Lmki2AU5
	zrcejMrOw+bu6ObK0enDC0idJ7ero81numUhztQnfKBskjqdzbZRkul0V/U1KoQsSxYh8GyLWuD
	Wia8pXtX9ZLvIXwkXSB/RM3JBMZ8tKTJmGyQ6zTfanRyKeSJ9zgJ+Q+fEanLdonMLriplJLXlmr
	zj+0FEpsZKNXGfjaWMI48zz/TDGSmDfXgwCZQf/kqXp+Y+1PeY1+YfqKr7nF3XZc3T0wf8flzeG
	LMKATA9EeDn0LU7lH1rv7SO+cU9bNNPst0o07JiUO1NeY5cN9g4JpJBbYgc5DcCwmGCGXpjoKoD
	TBDODbnpeZcZ7pS5+NZzp+DyY7/zFfQgH5EJu3sUhfzS4g3CXsNYHZwAkBg3kZ0UVCOthfLfqQI
	gXCmcO2U74EMetvo6Ty1SeIekmwepWx42XrOsHPkLBSPOUcilUnfKNS+x9psf8lQ0Zt8H8m73et
	UgKKOE3Vtb8qReafsGepZt4qvl7MzEpLspaPOkxE2m/JKs5kCPES9ve2pt9BJD32MZu2dc2QM7V
	a7gyUH0rBT+Njm/N096IqRb1p1qD8slOlgMTtmY2akXOzlSeWWaHNf6Cl2HwpUtL2/f8l411GlR
	c9hq4h09E3rGb2Y4=
X-Received: by 2002:a05:7022:2209:b0:1b2:43ac:d3a3 with SMTP id a92af1059eb24-1b5568b9e59mr16444195c88.24.1795476298544;
        Mon, 23 Nov 2026 15:24:58 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:4121:d698:201c:9274])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm34835125c88.13.2026.11.23.15.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:24:57 -0800 (PST)
Date: Mon, 23 Nov 2026 15:24:56 -0800
Message-ID: <a545ef5377ee473829c3780e94d107e5@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-input@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] Input: goodix - sync the irq controller while starting firmware
In-Reply-To: <CAORyz2LNRfnvbCLe+49A5kAF4NSi0zuYdpd95+7=Hx=KQh0B1g@mail.gmail.com>
References: <20261020122712.526797-1-l.scorcia@gmail.com> <avZiZoGO4jXjIP7D@google.com> <CAORyz2LNRfnvbCLe+49A5kAF4NSi0zuYdpd95+7=Hx=KQh0B1g@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_152459_584927_E6D50AB1 
X-CRM114-Status: GOOD (  21.46  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Luca,

On Mon, Nov 16, 2026 at 07:53:58PM +0100, Luca Leonardo Scorcia wrote:
> > There is call to goodix_int_sync() right after call to
> > goodix_start_firmware(). Is it still needed if we call it here? I think
> > the vendor drivers does not do it.
>
> Hi,
> unfortunately yes, it's needed right there on the Lenovo Tab E7.
> Without it, the REG_SW_WDT right after it fails with the error "Error
> reading 1 bytes from 0x8041: -6".
> The vendor sources for this device [1] show the call to
> goodix_int_sync exactly between the two interactions with the WDT
> register.
>
> Actually, in the same sources I see no trace of a second
> goodix_int_sync after firmware has loaded, so the existing call could
> be moved a little earlier instead of introducing a duplicated new one.
> I tested moving the existing call on my device and it works just as
> fine (basically, my patch + commenting out the existing call at the
> end of goodix_firmware_upload.
>
> Which vendor sources are you using for your reference?

Sorry for not being clear. I was looking at the same vendor driver you
linked to, and I was asking whether the second goodix_int_sync() at the
end of goodix_firmware_upload() was still needed once we call it inside
goodix_start_firmware(), since the vendor driver only does it once.

Since moving the call works on your device, please send a v2 that calls
goodix_int_sync() inside goodix_start_firmware() and removes the second
goodix_int_sync() call at the end of goodix_firmware_upload(). Also,
please change goodix_start_firmware() to take struct goodix_ts_data *ts
directly and use a local "struct i2c_client *client = ts->client;" temp
instead of going through i2c_get_clientdata().

Thanks.

-- 
Dmitry

