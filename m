Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D91C54EE9
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 09:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CHVoh6AydMdVyNdsw6VEdTT8sVcwJuX4/7OtqF81TLE=; b=kv2yWCYwOjpO63sqKlF1BQycOK
	X84ydZ42X2lkAEz8cE7kRHS7UFHbfvQ7NzKuhHvjLCPNAtd8TetKkc+WvkMwGm+EppZUhDxhvghcL
	OqxX9DnP9Pq/0Er4C7orqLUOSa/dARPNdMulVVMcGB/z0nch4yf07BjXvqRjtE32zKbJFzadSaVXR
	1FttsDScJyXYdANvWIhXsvBhZvNg0lQIxzh/OWzOK+NAowt5ouY2dufOcTzeBbVN0RzZe88blhBMG
	L3YERzREYpBWkLjJ5SFK1Dhm1XVRN0iwgqMmH6Bu3IKXjAc1lZcP553ZRhlMcLKUAdHmDKcR0nSS+
	mSNAZHmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaDS8-00AzR2-1m; Mon, 19 Sep 2022 09:52:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaDRh-00Az1E-1K
	for linux-mediatek@bombadil.infradead.org; Mon, 19 Sep 2022 09:52:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=CHVoh6AydMdVyNdsw6VEdTT8sVcwJuX4/7OtqF81TLE=; b=i6UDUUENt3GRCbrdpevGw8MwsL
	OyqOoD8rjpsNjP1eSe6TvuyI5ql3EU4ov8XiGap84exyRV51J0W+9djStKSZDLwxiX5wvQlEky8Xr
	DXJKKXFcFB6fYt0rlZiVvEnbDFogiu1ZOaaizQCVmrAkWvqRrnod4XMrND2le2twoO6bq4QoOhn9N
	39MmBpDksPPMchZ7qZkWzgkzMZjm/z6uoVIF64/rhZtL2EVC+iiZPuqgG52Bx0DUX+QLHdxkc/kVZ
	kYVybv90ksncz1a2O954YgKnWiRUhm+m64UkVQPFoS6CmXEYTQUkdUCjbCIJ2+zdmpOeuZfwAnzgY
	yuLSh8Kg==;
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaDRZ-00E1mf-6b
	for linux-mediatek@lists.infradead.org; Mon, 19 Sep 2022 09:52:05 +0000
Received: by mail-lf1-x133.google.com with SMTP id s6so34816767lfo.7
        for <linux-mediatek@lists.infradead.org>; Mon, 19 Sep 2022 02:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=CHVoh6AydMdVyNdsw6VEdTT8sVcwJuX4/7OtqF81TLE=;
        b=AsUtDZLutjYAmPuubd5VJT7esoukKBV4drhaipeCSPKxFSprD/Z0M3c5QRBWu0cyyD
         ouVrfCl8OORFdekwNoBwNhFR9U7ndxDKDos9VWw62Qymi2+VZGLP7XylvDA0t1ZHKYfb
         hmRpaUrRj4i0aVFafXU/drjl3I0IYfiOOD1wKGEr5aFW5JTTtIGYYUHRtjH/yy6W6pmx
         ZCFyoktY8JvMBm38nYe99kSyfOFZmFNJzY6SuC/Y07tLW8tbt3LThpNorC19V28CCBTK
         Ep+wJYpIabNauK9No+9itwZR26x9BIGA+29BKOeMdtOwtKRIhCxgkKe28PFBjA68Xlw1
         ONIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=CHVoh6AydMdVyNdsw6VEdTT8sVcwJuX4/7OtqF81TLE=;
        b=40H1ncCBJe6rbPLVX3diZXxLYc/xxK2T6+hW5zbCzXGK0CiC74wzclpf9W2vow03Rr
         8Hvu9fSodXnkIO91eGT81IKQ0z8fXMF1OfNY6UryUKODaz+rl443gLI4dwvU9JvKlqBA
         uONfAYS1fSuz4WNynKxjgRebwvPzvX/pm29cmctjdJRGwqLEUGkbOUFWeuXvjtP3Ia86
         UxZEvkl0B360o2Ck0m1vVh9L8BdhxLk/zZWvHbtDM9KDhkJTZ0DKO93PWi/GErsKttkX
         qBtC6QSXZTwicamTJCTE1MqbqzNrg4PbmhaVCbrgvuEq3f5kfHKt7TWtaVaA83S3pbBC
         KAEQ==
X-Gm-Message-State: ACrzQf2ifvTBwHRuShHwOy6v4c36DB9CSK4appRbLsC7bUGLuDLbBfwi
	skCdLjqRKiIv9+SqRDfYiU8=
X-Google-Smtp-Source: AMsMyM7ueLFa3mwyZJZLiCmpSdCXCJLMG0inR83nTec9J8BjIHZJdlOX2VH8AUZJV6OitbHR4WhCiA==
X-Received: by 2002:a05:6512:909:b0:48b:954c:8e23 with SMTP id e9-20020a056512090900b0048b954c8e23mr6486606lft.670.1663581116524;
        Mon, 19 Sep 2022 02:51:56 -0700 (PDT)
Received: from [192.168.2.145] ([109.252.122.187])
        by smtp.googlemail.com with ESMTPSA id b2-20020a05651c032200b002618e5c2664sm4683016ljp.103.2022.09.19.02.51.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 02:51:55 -0700 (PDT)
Message-ID: <0fc52b8c-a8a1-0e73-6f1c-da554681c9a9@gmail.com>
Date: Mon, 19 Sep 2022 12:51:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH -next] drm/mediatek: dp: change mtk_dp_driver to static
Content-Language: en-US
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 Yang Yingliang <yangyingliang@huawei.com>
References: <20220913134929.1970187-1-yangyingliang@huawei.com>
 <6051fab8-e198-fd58-2dfe-b2b344b67c15@collabora.com>
 <CAAOTY_8yTkkBNEv=MgRj2+JQM0=bD+z2wFsTT7n6uEC0ay1L9g@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <CAAOTY_8yTkkBNEv=MgRj2+JQM0=bD+z2wFsTT7n6uEC0ay1L9g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_105201_499677_C465BAE5 
X-CRM114-Status: UNSURE (   6.87  )
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

Hello Chun-Kuang,

18.09.2022 06:56, Chun-Kuang Hu пишет:
> Hi, Dmitry:
> 
> My tree has no mtk dp driver yet. Would you like to pick this patch?
> 
> Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> 
> Dmitry Osipenko <dmitry.osipenko@collabora.com> 於 2022年9月15日 週四 下午5:04寫道：

Applied to drm-misc-next

