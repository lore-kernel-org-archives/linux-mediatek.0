Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A304CCA472
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Oct 2025 13:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qc1+9X3nEr2WNeOTdZVDz45D/LQvZyp8mgMOhKpaByA=; b=SGSXzSUwjBIa8iYwF7Q/X2ZOTV
	hFqs4p3OfeiNsSHD2DZgqqVmm9zwwn3slep31onDF0cI/b+kSvoK2GwY4FXaP2nQtHXFkzrhGpdF1
	a02R19/QYA5VCMxWeq3Anj3AixXrJ5MpykagTmhJ0T8FkHaAWtdK4Kk85pyQJv885/ebGRvfYvkdb
	xsvLUvNp6WBc2WXxMRLHylWIyTml1Htabj6yh6YU5wlzq3McE0Lrqz+yOYN0Z6pK8twamNss4o+Qx
	44hgF6/MuJmBKPqD7bC8wvZmeiSjgV+QGbZE9lBAyZnZPqKcXYmu/BmeuUrpBkGxl1MUyFRvTbtaf
	ugGZwy4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Txr-00000003umC-1lET;
	Wed, 08 Oct 2025 13:12:19 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Txp-00000003ul9-3HSp
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Oct 2025 13:12:18 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3f99ac9acc4so1925647f8f.3
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Oct 2025 06:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759929135; x=1760533935; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qc1+9X3nEr2WNeOTdZVDz45D/LQvZyp8mgMOhKpaByA=;
        b=NUwU1KSUDckslyOSEKM9NSRzzbN2UIKKFHVt2oi9PYG5Bv5d4Z+u2JPIOXi0HfnhTu
         qY+bTJmVPksGgfqfck1gaQYts8CgtQOSExdUQNvNQOGtB6qI6coRr/nIY3KbUsf2Kc8O
         /nDPXefQIV8itD6sehWs2QuMeG5KW0RBtQT9fPVIZgSEhYXvmSp9y4WLhsdMVxfMGhPO
         7xXmFyk29z4vkFTU1sI6ee+aor/qod6uWJ9ohgVpVwYHPlkGmK7ykThS9xfU89Lk5aj5
         oTcK2gk0TW9NiSggwN7BO4V3WyO1OXk/BfFSLZ1BDXZ++TinZoqCtuaVUh+b754nCq1h
         OU9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759929135; x=1760533935;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qc1+9X3nEr2WNeOTdZVDz45D/LQvZyp8mgMOhKpaByA=;
        b=cAzNPa4e0cpiM+orPosfUDGE3WJbaBL2Mnv7LP3wSkkRqUgljpHcFY/cc1W6CJEpXa
         DanjANq6bZpjREgo+vjcpfBtPYmFPkk2YcJCvtFn5ab3968HD5nIs287gGc3W+q/GbeG
         VixF93uuCJRayGqlV8TW5dzGnIJ30yfAxNwCQdm9xT4FArCxpxFAIBOnSLDY7lee9uV6
         XWMAS/jABc9vCAL7da7zRmmMULggLCvu7SI7Q5feIN3fCjVhcwaqG/Q58DYoTAO79zUR
         4jfJ0VOY0cbc0aA0zXsyo/+xG2QKQT4TkBOGlUHpcCxt6vswwm/Ad0v2KAYhJcCd5qJM
         8lzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUzMy6YGX2nNFqIZ/4oNj61nOUeLNVluM38NGxsC/RtD435taTRPG+30Ru7ZAGX9LA0OWMjfGqzviGJ8ASlg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwP2/H3/nizbmt9UEYUCuvV5Oq6qbQ8D3vli23DflvV81vaUXDt
	pwa4Bolu5uVTSGxFLjosxkjRXDtViG+737QrH+FfVFbVaUV0QxZBUAzy
X-Gm-Gg: ASbGnctJIBtgxG//vYMjTDdS7Mjbye78Evknrp5aPraWLqJIGa6uO1547qSO9gF5RdI
	92WPw5FiP1ljZFlWeFJhmzRh7pZY0WnnJiDlcLm5RbXJO2lWvfHoyb05/xIMqSCs7WtwS+fdDOZ
	4Izm/c90OKprqSDcczYHgeHvEY2AEL7t6eQqqn5tHN+ooPQADwvWnu2Zo54cU3IYbjGAZtiAuf3
	RqYxscB1LaD2+2hTXUqZ9DboGXHcJBF3LL6dS5Ju0Og/zycjoglpGDxnHE5wfvt2nXxFKsW8HUx
	McAEUqNSubCyOkMPfc5t9uaIqrrOb+Oqjk4iq4KBkhMK6mK8REd4P+IYHIBrSy5cikiRTHfJRz7
	0FcCuugeNeWDAGI6VXAnxHTmZUiqQEeWS0wjRIML3L9GvonBYlE8kqAr0lOEKrkfYiOSN2+83gT
	MLwvC+UjDeAb0bR7iZmfxSGA==
X-Google-Smtp-Source: AGHT+IG22PFjiN1NNDmZTXxfAAwuCghTytfGJ5ZjD4UTCsjmtKsGg+54Ln7d7u7uXlzxgdmUFId4DQ==
X-Received: by 2002:a05:6000:26c2:b0:3e1:9b75:f0b8 with SMTP id ffacd0b85a97d-4266e8dc01amr2094999f8f.47.1759929135382;
        Wed, 08 Oct 2025 06:12:15 -0700 (PDT)
Received: from [192.168.85.4] (net-2-32-43-137.cust.vodafonedsl.it. [2.32.43.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fa9bf8295sm37533375e9.3.2025.10.08.06.12.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 06:12:14 -0700 (PDT)
Message-ID: <d0a06fe1-abd0-49b2-8867-6c01d6551e54@gmail.com>
Date: Wed, 8 Oct 2025 15:12:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression in linux-firmware-20250917 for mt7921e driver
To: =?UTF-8?B?QWxsYW4gV2FuZyAo546L5a625YGJKQ==?= <Allan.Wang@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "sam@gentoo.org" <sam@gentoo.org>,
 =?UTF-8?B?TWluZ3llbiBIc2llaCAo6Kyd5piO6Ku6KQ==?= <Mingyen.Hsieh@mediatek.com>
Cc: "xiangzhedev@gmail.com" <xiangzhedev@gmail.com>,
 "linux-firmware@kernel.org" <linux-firmware@kernel.org>
References: <87bjn6fgr6.fsf@gentoo.org> <87a52n1xvv.fsf@gentoo.org>
 <dda63a6b723d31f41e6e275ac7f38d31c6715fc8.camel@mediatek.com>
Content-Language: en-US
From: Matteo Croce <technoboy85@gmail.com>
In-Reply-To: <dda63a6b723d31f41e6e275ac7f38d31c6715fc8.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_061217_823258_C49EDE15 
X-CRM114-Status: UNSURE (   6.91  )
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


On 22/09/25 10:24, Allan Wang (王家偉) wrote:
> Hi Sam,
>
> Would you please try "insmod mt7921_common disable_clc=1"
> to help us clarifying this issue ?

I confirm that disable_clc=1 fixes the issue:


[    9.390667] mt7921e 0000:01:00.0: enabling device (0000 -> 0002)
[    9.406941] mt7921e 0000:01:00.0: ASIC revision: 79220010
[    9.489525] mt7921e 0000:01:00.0: HW/SW Version: 0x8a108a10, Build 
Time: 20250903123148a
[    9.524024] mt7921e 0000:01:00.0: WM Firmware Version: ____000000, 
Build Time: 20250903123243
[   10.611659] mt7921e 0000:01:00.0 wlp1s0: renamed from wlan0

What is this setting doing?


