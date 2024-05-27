Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D42C25B74
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 May 2024 15:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YAjC+AWcuEwWtYc+0bhe6ljoU6fNPzKyPApNDIZd6II=; b=MOLWXJpCesN1rqXlMlRDcOpe7s
	FMI6czU1gk/V2QLoeADTkWPn7N62S0fU5GrsUCgZe+7A5sAqxmBarZxrj39uq7U8/jAn+TRuAbr76
	XbB85jj5EI8xU9ApfYhpMH9b7Yt7IWek61JYbV794sWL5gt+1jSMa2dH79AA858u5u3FfjXwLRDgH
	oEm1rvSCXeJEd2E51b47Rasve5oJJl5DkQMHCZ0lFzWIZm9zJ/Q9NagF3XCdg35iiLxNl0HWXVRL4
	4CAzGOrGWHDUn13hxdL54GZphDVIQ68KmFdlrJ1llIqSaLr4CKPFnAaOu5jQE16X4EskNAg6Lwn24
	Z0gnYCeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBcEL-0000000FaUs-0v0x;
	Mon, 27 May 2024 15:25:45 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBcEH-0000000FaTe-0JtK
	for linux-mediatek@lists.infradead.org;
	Mon, 27 May 2024 15:25:42 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5785fc9c543so3408060a12.1
        for <linux-mediatek@lists.infradead.org>; Mon, 27 May 2024 08:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716823538; x=1717428338; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YAjC+AWcuEwWtYc+0bhe6ljoU6fNPzKyPApNDIZd6II=;
        b=JPWTYt35qGmbUWztauYvl3v+ihdUwueKDm0cFVOOlSBxxGkvvDG2BCDrsUz0YFLKee
         h5JxXCSWL8fjp3cBN1FDkB8QrQZXuTJq1OjNupc57eL3GqMzNkzfkgjrAkKUgyyI3GIX
         jGsOKWYZhj9N0rpR4SVE7ke6zXc8mK3IZ4MLe4LSmanaoaANeMtOzAqEiwTjJk7kfi8l
         a2CgToeb7bkAFbYhmHb3t+NPWBLorqbAtkkif/quSVO7vlu14PDYGrSdOGCmkrWSqIAR
         d9lSh7Qan0pbY6OIWJxRjjmqbvycmbI/GJQJi3+i22D8u3JudAcJ/YByLcN41lzj57TX
         4vaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716823538; x=1717428338;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YAjC+AWcuEwWtYc+0bhe6ljoU6fNPzKyPApNDIZd6II=;
        b=j5GQ/9XsclT7CaiScpF1SA5Tb01iXxIEk0L3DJDdIsocTBz0onFtD6T5/1jBvCMHXQ
         saPI9XI6XZ1B5d4XWTlzTx0oOcC5NP6csL9sntnQyuaxMJym7REJ5LQDpgInbBsg3aUO
         0x9UqmkdzgeemShFEHegf/uREFgF6g1kd27/896KakOUF6OdtNTTz5MBHQhTYbUGaF5P
         vySbHjOT1+Hvd5jJsBUJ1lGEhnG4xESVGXCteCEomk3enHHajUEb2QmlRO+FsToyN0Yf
         CjDYNhxKTIUB/yliHXBvg18RJ6UxHTwlvDyQfCUp4aMchsEz0DHiaBg6125/dg6tuwUY
         swyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmmWklt+xH38T/yMTplVXq47uuqzBg15TRnjV4jz1hBZNtUuZghQFE7eATjJ8YuhD6puNGc268LAaJ2b4e9Xucn09r86nNWSuXExoIPVE7PwUD
X-Gm-Message-State: AOJu0Yzylnh8WbaCszAwnMkaQBuOEOxmf2p8soF44Hu2OJ5lyB1A0Owt
	JqqouG6F6iH7DqMg41+vSPkZxGu04EOG2N4xGptPKqLJNfhs+F4w2bKiSIkKCMw=
X-Google-Smtp-Source: AGHT+IGiRaldR9hXVy64MuaHnv1OfdgE/94U8ZZ1bdADsFNgO9ZW17mi5WmshRO62qu9oJ2+WFqVOw==
X-Received: by 2002:a50:ab13:0:b0:578:5d8a:cd91 with SMTP id 4fb4d7f45d1cf-5785d8ad8e6mr7556248a12.41.1716823538210;
        Mon, 27 May 2024 08:25:38 -0700 (PDT)
Received: from [192.168.1.70] ([84.102.31.61])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-579c3bbee4asm2952382a12.76.2024.05.27.08.25.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 May 2024 08:25:37 -0700 (PDT)
Message-ID: <61a1be10-7df3-4ba7-b7b4-ccc7f0379656@baylibre.com>
Date: Mon, 27 May 2024 17:25:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/6] dt-bindings: thermal: mediatek: Rename thermal
 zone definitions for MT8186 and MT8188
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Nicolas Pitre <npitre@baylibre.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
References: <20240524-mtk-thermal-mt818x-dtsi-v5-0-56f8579820e7@baylibre.com>
 <20240524-mtk-thermal-mt818x-dtsi-v5-1-56f8579820e7@baylibre.com>
 <20240524-concerned-fritter-262f5e16293e@spud>
 <20240524-clatter-antivirus-b1939900ee58@spud>
Content-Language: en-US
From: Julien Panis <jpanis@baylibre.com>
In-Reply-To: <20240524-clatter-antivirus-b1939900ee58@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_082541_145908_E5522ACA 
X-CRM114-Status: GOOD (  14.47  )
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

On 5/24/24 20:27, Conor Dooley wrote:
> On Fri, May 24, 2024 at 07:24:47PM +0100, Conor Dooley wrote:
>> On Fri, May 24, 2024 at 11:04:34AM +0200, Julien Panis wrote:
>>> Use thermal zone names that make more sense.
>>>
>>> Signed-off-by: Julien Panis <jpanis@baylibre.com>
>> Removing the defines is an ABI break. If these are all the same devices,
>> but with more accurate naming, then keep the old defines and add new
>> ones. However, the GPU1 define changes in the course of this patch which
>> is more problematic.
>>> [RFC] When PATCH 1/6 and 2/6 are squashed, checkpatch raises this WARNING:
>>> "DT binding docs and includes should be a separate patch." That's why I
>>> split them in this v5. The problem is that the driver can't be compiled
>>> any more at PATCH 1/6. It needs PATCH 2/6 to be compiled. Should the
>>> checkpatch warning be ignored here ? Should I finally squash PATCH 1/6
>>> and PATCH 2/6 ?
> Heh, and there's just one of the issues caused by your ABI break...

Conor,

Would Russell's suggestion be acceptable for you ?
I mean, this one:
https://lore.kernel.org/all/ZlDMNkdE2jmFgD8B@shell.armlinux.org.uk/

I could implement it, but before submitting it I would like to make
sure that it suits everyone.

Julien

>
>> Why do these names even make more sense? Where did the old names come
>> from and where do the new?
>
> Thanks,
> Conor


