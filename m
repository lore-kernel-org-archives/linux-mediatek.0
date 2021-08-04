Return-Path: <SRS0=9YCi=M3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32D35C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 17:35:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E809060EE9
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 17:35:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E809060EE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=4ALHvgCzPzSZ+Ai5lqmYd7y+psxa11zljM6UiftEszE=; b=wbau+V4liIAjXYTLh9mi8MoETu
	p5fgpE5CWGi6y2Ykp+3RGpTMzWV5ccQ6Da1VtZikZ2lMqcGboNml2npw6fu9V+peQmuySYPzqFOct
	diykezHBayz9PqilGbP4/oIQTSnITcV7l1XLjRpbOJxiNxq1yb/tjRShVxyxAwNKVVicNUvohzlKw
	qwlvH/IosSEGVhydFfe+CM2l+/P7y67JjbWoGh78tZQlQyEzpXlPEnsJcpfZMmbFBXUbkl18nUEqv
	duXuc6O5r/WcwzKMuM8wss5D5GI6pPDp1Vp1NyyWfi4WI5SYmMzyqYGHF4FtqCX/RrF98hDZKooUQ
	/3IrmXVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBKn8-00723S-Fk; Wed, 04 Aug 2021 17:34:54 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBKYP-006vFl-Ve; Wed, 04 Aug 2021 17:19:43 +0000
Received: by mail-wr1-x42c.google.com with SMTP id z4so3059403wrv.11;
 Wed, 04 Aug 2021 10:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=O9SItd3XY405dHzvkc9GDc7qBcgktuPcRH3jW9NDsus=;
 b=a7X1e0HiSjvwjVXzD8OJgN8F0pq+uSvbd+ug23nvL7Qfj0KIXJ/DxQL515BzoQxjtM
 KGmGjJSfj6+nMw32lREnSJK8vXnQ9A91vVIBFmYSYmV0Za2GThvhHLls+jxcF2d5JS9a
 D71ajMPeqbB1ahf6ZufXJaCChi4HEmCI6l88zujyjQLiLUvhXDzWEA20E+16DTiZTqW7
 aNW8MvxX0FjUdEx3ZM4SnM361m6RD9Ymnq+nEzsucSJ79IUQKeh/Pjkqutm7pBV+YqGC
 n0E3S2kjkjR4d+DMrfaaTjPcFTHDm2cE0vTQft6TsfSY7lsWHFkJMnZ48JwLI1Pd7Jit
 +blw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=O9SItd3XY405dHzvkc9GDc7qBcgktuPcRH3jW9NDsus=;
 b=NyI28liyH6G+voKrcQd1QtmKhr8A3R6f8Fa+exTvXw1vx6G0ZQrYeqMuG6dYgBNKQq
 fovG9lbpSP2CxXiNe4J6MRVSTDQYOUC4B4Yu6z09wYDL3zkUMX1wwW5qmrLrmKEdALbP
 69eJVIT3XUDA6y+u2LWfkoDA9nDrP2yA0nqeSD9FPdc0VXlPPea/ISrQSJ9QBJBUgGFu
 JlD9IfC1yxqvzpHDuq36IYVaQ9hTGQXMVcvjcqA+P95zP8lYxzW4lN/oVp0uMQS9Rx3c
 rrkBEwCIUIaCrreulbFCWd57nn5XZ/w+TZ5GF3bYrUHNP8/l6DI/1IZ3Lyi9pqKO6SFK
 6+CA==
X-Gm-Message-State: AOAM533hf9IsbgQ5UhKeCi4EpWvIT3qOSV7c0wwno9VchDR7cS1yKs8L
 jXmQutLIXr/CpTltZ+Mas5g=
X-Google-Smtp-Source: ABdhPJy1Ufwahx5HIvCTUwg/AGqU6WYCwDXtjONKbsOazi/UN4zk+Nv/cBLQovbRWSrw19JuGoZPAQ==
X-Received: by 2002:adf:f710:: with SMTP id r16mr470460wrp.124.1628097580131; 
 Wed, 04 Aug 2021 10:19:40 -0700 (PDT)
Received: from ziggy.stardust (static-55-132-6-89.ipcom.comunitel.net.
 [89.6.132.55])
 by smtp.gmail.com with ESMTPSA id w18sm3537191wrg.68.2021.08.04.10.19.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 10:19:39 -0700 (PDT)
Subject: Re: [PATCH v4 1/2] arm64: dts: mt8183: kukui: Use aliases to mmc nodes
To: Chen-Yu Tsai <wenst@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Enric Balletbo Serra <eballetbo@gmail.com>,
 Eizan Miyamoto <eizan@chromium.org>,
 Devicetree List <devicetree@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>
References: <20210728040710.2891955-1-hsinyi@chromium.org>
 <CAGXv+5EVcSyfG1Fk6PZOnWUZo85brf_cneW7iob4Z5gnjFca7Q@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <fb0d8da4-6d0f-b10b-a207-af234d47b171@gmail.com>
Date: Wed, 4 Aug 2021 19:19:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAGXv+5EVcSyfG1Fk6PZOnWUZo85brf_cneW7iob4Z5gnjFca7Q@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_101942_102913_B291B091 
X-CRM114-Status: GOOD (  14.18  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 29/07/2021 11:58, Chen-Yu Tsai wrote:
> On Wed, Jul 28, 2021 at 12:07 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>>
>> With commit 1796164fac7e ("dt-bindings: mmc: document alias support"),
>> a way to specify fixed index numbers was provided. This patch use aliases
>> to mmc nodes so the partition name for eMMC and SD card will be consistent
>> across boots.
>>
>> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
>> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
>> Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>> ---
>> v3->v4: change commit message based on review in v3.
> 
> Thanks for following up. My reviewed-by is still valid for both patches.
> 

Sorry for the confusion on this series. I now took this version into
v5.14-next/dts64

Thanks

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
