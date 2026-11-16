Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F590606A322
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 18:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mJ54a9k3;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a3VbYEqh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=choMbSoYoRkI4EZKogv+on35PXN8ET4WeIfVWxIT3BE=; b=mJ54a9k30g9knX2LntDsJPUTc5
	y/RS65gZtrEwmTxk+UEJb4ULlk3mAkVfWm7/x/PwCDiFzYYjul3JEmbn47KYQwzo/rq+NNLvvWxE0
	9DqYZwIuLeDaYf5mWqJZdCT67nEJCeRIwfS0T4wyJfDkVxJPMQifnZIzFz3q7+gphgJE1sfRNMCb6
	jnupmB9FkgwqX9McO9buXRZtJiI8FK6KklTZUzkMR/IJ3+WXS12klXYqZmhUxYy+Xg3+w4y0dOYKu
	+fyDzuZZxZgmk3EZLLX9wu+fhU6ro6JcFrNYOd04TH9ZxKBE9BSiaFymlIU+0u+Awi2IunQhgjhr/
	XQWejWag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1qO-00000003g9T-2L1S;
	Mon, 16 Nov 2026 18:54:20 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1qG-00000003g3m-1VtD
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Nov 2026 18:54:17 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-6b571979178so5925251a12.2
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2026 10:54:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794855250; cv=none;
        d=google.com; s=arc-20260327;
        b=EaNxW2EeI973BcRDgc98TCbR+iBD/OvN5bvPIQXwy1T2BtXowifDU/TwNUU9w5AWYO
         p+9QE8dVJHVWgwsWjLJ68y0OWheSLTM8ibmKZzdegVeCUZHJ7f8g635tTCRoFplwtFgH
         TXEtoxfdS/CNTFwTify7eX0Pqb9vzbvCE87OnmNbZxpV35UQVJm35sK+P0CyXnUoOchZ
         nsPKMtStwQlzkOTp+ercMkZ8nqDxcBKfG3brUNkXWR5wHqEp+ZNBAFySVf8PdxsPCSg3
         Bat2eBfLkTgSfquX1Mjd4L27Q+iuchzxmcUphkasoKXvk5qnq095ygUdJ0u5c0pxQ2mI
         v/QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=choMbSoYoRkI4EZKogv+on35PXN8ET4WeIfVWxIT3BE=;
        fh=hq9S8Oa8+3Eg80dr/rr6b5iVzFpCgJeP+SM0Lee8NCw=;
        b=iH1/FbxAXao+eUmmd+kfnbPE4tTbyqMM3hqViQrLODjcBBa6Yl3EDW1f30h3xAIjhi
         l0OkPx+8dP1sjagCC6p/a0RxJSTAAu/n51LSeqXArVPCQGytS8CqPK3kFxWVRzNCo8Oq
         P+dEwTf24+uk/BugMbm7+ijf0mmr4v23usKzD1u1adg87UuClFG+JHkRiNSflaj6xlb1
         LybYc8QtFT+JFgo0FzQQa2OOz4DAAfUR5p1gKEAYSamkBiNkE7/A/Yb8yEfRRzsC18a+
         3V7HKIyLlPUClED+pfLUA8suVJTgnMFLwG3A7MMCGshwRTbw7SOC5DsX3kRjttgJnry0
         cOaw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794855250; x=1795460050; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=choMbSoYoRkI4EZKogv+on35PXN8ET4WeIfVWxIT3BE=;
        b=a3VbYEqhMXzxD9GMdg9093pSp2UDY3LMbKLM02q19wGVosgZ3CdokNZlQuKrkCRXxV
         km3qnttovBRv0ML/dxIZHVgY7Nmgh+tSlstmY8oqNQNQs6Mjl+Nz6C3GuzfMop7YrUXu
         x4LRZHhTcuzkOpa8Qj8E+LsYC7SMuIaGL2z1MYKPUgFsRpYfYvC42mJEdl9Pjjcm1E4V
         i8lAZYMfPzg2wn82nSpY2paMRTsb9rrK2ZI+M6Gl41SNuKyamgREiK0O/3GWUJJfLUy9
         fmMNpEnxt7KUDffVLlEk4Reqzs8eJH8h3rHRiD9p/qLzaiXLGsRCAUlbfp/IbqyGQ3xh
         ijPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794855250; x=1795460050;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=choMbSoYoRkI4EZKogv+on35PXN8ET4WeIfVWxIT3BE=;
        b=u+CYnfALMNlcp0YM0VWvHfMNRFa5eS4jC9guxhlbMSldZop0sDAjt7oOQTJOmIVypK
         B7dEUMOHSDoXHGoiXBz0nYTJEtaEfApALUUnPNOjap2Y9Yi0+6BiA5WRwxQPhtwOqAYx
         JXU5Lc4/TQXsAw8D7BoIfXsUHuWzymmQ7XLjkqarAqyO7qTS7HWcRVKd3sL8OCqdhMci
         oI7gxvYBY4wXjEV9kRZ/+UEPs2Z64tJ4KMyFBGHf4GUgpFElA3WD42+trlZOjJKgz9Eo
         pV5luUsxyqsegSNA5vStEgekMOo1QrLJtaX4jAuX3FyBjb1NZdlxEVWKbVYnjdpTrc73
         4DxQ==
X-Forwarded-Encrypted: i=1; AL+hErHsObzJhhtiXkFF7TPQmp41VOnSlSM6Aq5ErNDYtzpoqoouPyrNvrh0OIguZoSeyuI/XIXNCIL++tPAubrF7w==@lists.infradead.org
X-Gm-Message-State: APuU4Z/Xqn4+UnDTRJe/wOgYrXksZUF0Sl5fAvQvw1o+xSk4864ovxh+
	z0Fivz8pT017uglqfeRYPYjheGByOkyM8zRpp87f0ER4sLRvRfxx4jLK1WhtwDs2y41qv70YnJS
	h8YfIvVZUs7Qz3MhPEgZDeyIo2gmXsFY=
X-Gm-Gg: AYBFou0G/3e29B5pZzajMpV7K0TZLnvJIilcuTtys0BWX+e+kbW6izHXDGh1+TP/39d
	cNsQiGHvAe5uxgwQtgHpTYTGOAwWhjmHRvPyokqVeB+SGZaFjYWbbHdz13Sy9HYbMMXPSyOBfF3
	IpvL65SNYYb2YQvjIX1MfMWzZz8tt5GhD5YD4Eh1xnXtsJDt2LTX8o5KVVQwdw2lW9CadMWtmBS
	Q6MbWCnA9RKkIoT93yZR0816aZ2CEzOG4px4bOs9ESzGKCnriKFSeoTWDhgzthmu6p4R1RjH7OE
	FsnyCWR2E4IKnjIYlPzU2npDdWAQNTyMgT5DNU+4HoMixyY7abK88HTEP6M9UTAGh/955vrDS/I
	OxZcYi/leWg1SkVfC1Mq5xiCC+ny5R0Ux47c=
X-Received: by 2002:a05:6402:3210:b0:6b5:9714:dea8 with SMTP id
 4fb4d7f45d1cf-6b7c0d24511mr9592011a12.45.1794855249794; Mon, 16 Nov 2026
 10:54:09 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261020122712.526797-1-l.scorcia@gmail.com> <avZiZoGO4jXjIP7D@google.com>
In-Reply-To: <avZiZoGO4jXjIP7D@google.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Mon, 16 Nov 2026 19:53:58 +0100
X-Gm-Features: AclHuK-ct3_bPqNEIOSB1NJrGGSJAI5u9bKqHSATB78hAxnxBRSskimQcv_9q0Q
Message-ID: <CAORyz2LNRfnvbCLe+49A5kAF4NSi0zuYdpd95+7=Hx=KQh0B1g@mail.gmail.com>
Subject: Re: [PATCH] Input: goodix - sync the irq controller while starting firmware
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_105412_443320_067D5CA0 
X-CRM114-Status: GOOD (  12.14  )
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
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> There is call to goodix_int_sync() right after call to
> goodix_start_firmware(). Is it still needed if we call it here? I think
> the vendor drivers does not do it.

Hi,
unfortunately yes, it's needed right there on the Lenovo Tab E7.
Without it, the REG_SW_WDT right after it fails with the error "Error
reading 1 bytes from 0x8041: -6".
The vendor sources for this device [1] show the call to
goodix_int_sync exactly between the two interactions with the WDT
register.

Actually, in the same sources I see no trace of a second
goodix_int_sync after firmware has loaded, so the existing call could
be moved a little earlier instead of introducing a duplicated new one.
I tested moving the existing call on my device and it works just as
fine (basically, my patch + commenting out the existing call at the
end of goodix_firmware_upload.

Which vendor sources are you using for your reference?

Thank you,
Luca

[1] https://github.com/lscorcia/linux-lenovo-tb7104f/blob/2dad69c9f28611ac6d3db2f1ee11b480a60d83ee/kernel-4.4/drivers/input/touchscreen/mediatek/gt912_p98996/gt9xx_driver.c#L1529

