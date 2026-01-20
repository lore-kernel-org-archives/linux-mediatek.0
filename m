Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81013D26296
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jan 2026 19:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sy76whdWsr2+0uhdxqV/7DmqprCp9p5S0npWuG2odvI=; b=CP1BZHHAi1+kdl
	Q5KLohJK7oGi+RT155ma6a5xrIDJC8Q+kmfA8vtEP9My2/BBpcFOpLxJgQm8rzsyVO5IVkJusgFYA
	c/fvzMzpoisQuujkPPL3LDEq5aqkvluukeLFnb7FeiroHBNuxDn7c1ZGGqpmWmUBLL3a//GJhyHbZ
	J3MmwMao5oY0jDIqJWB5KotbN8UYIliZ/5eV3Mzu9aul/shoGCdPnQS/vsCvF7pwi0DamHzgvyPmT
	4CBWX/7qSQTr3Fqe6z13H/JG6pSOZGVNNbP7CPEK8zPHivAnrvoCAipCcHyOwTZ961vRpjk9RL+Jd
	LIGz9eR3NaRXx6B5g0Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viHdg-00000004OOo-3oCC;
	Tue, 20 Jan 2026 19:43:44 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viHdc-00000004OO4-3V2v
	for linux-mediatek@lists.infradead.org;
	Tue, 20 Jan 2026 19:43:43 +0000
Received: by mail-wm1-x342.google.com with SMTP id 5b1f17b1804b1-47fedb7c68dso40585995e9.2
        for <linux-mediatek@lists.infradead.org>; Tue, 20 Jan 2026 11:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768938218; x=1769543018; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sy76whdWsr2+0uhdxqV/7DmqprCp9p5S0npWuG2odvI=;
        b=igcWD/GOY3qJ0OBaOMAydzyAuThJgK5dp4AA9CumFxwtwauuTxAhHGoEfh2ctMLB+d
         MRQrPADBcOIILaYOjVXdlp3xMSo+EmiLI6gBx5SwZmQAzoEwLcdCNunePsaMZHo4/moA
         qcYUVIo2YxHto7Oz8XaYN2pc+X12Bx9Y6LKJprvEXr02grdGHk4XObnPMoHQv/uCB3B4
         juA8hk9+nJY1Rn35KCr0B/4Prs6ilN1u5ZxscN+79ANH0y/A7EswYes12rJFb1CT5K/m
         Iowc8+DEw1mPDAGZnlziRH+2yzh37MDjg/tUnKA84fLzGNBEdbgSkF+I4+R6ZtM5Z81N
         kkhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768938218; x=1769543018;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sy76whdWsr2+0uhdxqV/7DmqprCp9p5S0npWuG2odvI=;
        b=RGFnH2GdxPQjMFJtEvbyJVaQhZMHJvYYnpjkBEAiGyInJJWxYa8BBqWqsP31reTsyM
         GYN4fFih9w/H/Q2+XBfwAofIM4vo07bsDW9QLcu+Fd86lqYJL9DvB2KGJonFXliclvOY
         C7s+c6L6IqgBZG72TM4WMXjJNFACYtR18O7ed/tKHjiaQKkXttRxbLAe7sexF/F7a788
         IM/atkYvlgw+MFQL2WSOqlFC9qyASvf6MVA+WSXk7gEdxFFhe5DVJuV6M7ZIkYn0jmAb
         VvOjD5N6rlj5GXuHTVK1hQA80uKkSZ/Wk0cvtyxZjoWa70nZUPnlgVKAwmU+9NdwgPFT
         5YIA==
X-Forwarded-Encrypted: i=1; AJvYcCUhKCZ8JdWtwHVsiNZxHaEnxODD+lm5wLzUNuPmj0BwVX3ncdshwgdUgAedsTCQ6IyZ4HQJvi2cqUzqoe7jYw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwmUu58xYsjgB7bgcfWFVuNgQosDWWOAa1XBdjf3VEmoqlr3MM1
	1XfLLSWv5ri1ndWbc11S1nhdeDgS2RITme5LFzm9S98G0qzaKW15QJJPR/33eEBbNTg=
X-Gm-Gg: AY/fxX5JooRiaB5NfTXTct6HkmuXJ5Np03NigH0mwolHjNZuzx9zVY9KztMMB49qyJa
	2VHxGmWXbJl0x8MmNEM9kLWTbdIshxzFEDOH52dXiW8J2D32iPozz2zg7RU8i1BEbdjBe+1Naep
	a7U7qtYISiTz2us6GFlwlhsJr2pixa2VI4LaW0Bb/AcBAIACi+dP5z6K8upVjLXkR34qsNHwzbc
	hA10l3HNt3349/92PuLFqj0FvjTNLaADEaEfUR1fm8UdSOuEA+xsOGnHYiBQhmjCOWyMo4iKDKP
	3mvBFldcgOh8pvERinkfXvVGMojBXaL382wdyknD9mf7uyAZbuaYZC6TfvYgqXzyptuYEx7GDke
	dOo//3Z8i/e1bLTr4J9rtM0emh4maudE0Vl+T4rv/uLdwCj3odh0c5Y0AilhtoaZF2Lssal8X8u
	QS/iu37OQxXtMItA0rMtAgzOIsgDMknvY65BjhH/W3gMlhT0ygP3dXSIGrEQnRXQ8=
X-Received: by 2002:a05:600c:458d:b0:47f:f952:d207 with SMTP id 5b1f17b1804b1-4801e341e2emr173523155e9.19.1768938218443;
        Tue, 20 Jan 2026 11:43:38 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:ebda:5627:9bc:1ede? ([2a05:6e02:1041:c10:ebda:5627:9bc:1ede])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4801e86c1b2sm257889055e9.3.2026.01.20.11.43.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 11:43:37 -0800 (PST)
Message-ID: <b43cae11-e67c-4979-9e9f-b49a0cd640e0@linaro.org>
Date: Tue, 20 Jan 2026 20:43:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/8] Add thermal sensor driver support for Mediatek
 MT8196
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 rafael@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com,
 matthias.bgg@gmail.com
References: <20251125-mt8196-lvts-v4-v5-0-6db7eb903fb7@collabora.com>
 <382ef406-6abf-4d6f-9f0c-42b0bbbd6918@collabora.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <382ef406-6abf-4d6f-9f0c-42b0bbbd6918@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_114340_989567_F548972C 
X-CRM114-Status: UNSURE (   9.49  )
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
Cc: andrew-ct.chen@mediatek.com, Laura Nao <laura.nao@collabora.com>, lala.lin@mediatek.com, arnd@arndb.de, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, nfraprado@collabora.com, devicetree@vger.kernel.org, u.kleine-koenig@baylibre.com, linux-arm-kernel@lists.infradead.org, wenst@chromium.org, linux-mediatek@lists.infradead.org, kernel@collabora.com, colin.i.king@gmail.com, bchihi@baylibre.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 1/19/26 13:06, AngeloGioacchino Del Regno wrote:
> Il 25/11/25 17:16, Laura Nao ha scritto:
>> This patch series extends the MediaTek LVTS thermal driver to support the
>> MT8196 SoC.
>>
> 
> This series has been there on the lists for *5 months* now, and it still
> applies as-is.
> 
> Can we *please* get this picked?

Sorry for the delay, it is applied now

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

