Return-Path: <SRS0=jGCy=DP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D969C43467
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2020 07:25:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81A8220739
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2020 07:25:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WHKaBEPm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uHE8Wbup"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81A8220739
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=phePfWR1S+2UnZHdnPshlMkqUVZwcRspYb57cwBQwcY=; b=WHKaBEPm+6gjqqSXwUVCSPbUl
	SUOFJaDMF3QNdjFfBOZweqZP/ChIwaWETzwE0BIvJrtD3HmNs1t55rTVreuDltWwmDvh4I2lMMh67
	fLFF5nbuWamteHHsBU38bGi5K72Q86L+FIYEcGa0fbFTj73KDIXfmtgzffV4ZHzVRQzQ1k8kVuDfx
	Re2SSLB6RuH4cgfwVcb3Em/2SwTshIG0NKCzi1AolO97EClhAhPiB9gXeN1VQoPPn7hkfU9mkVsnO
	t4d/sw2XEx6qydgrZZh5Yyem7UJw5hXyNGICeeMKy5ndyxzT4kX0Sc3HnoVdMNcOesYuOjp2dyiuO
	dlxd5xRiw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQQIk-00067v-Of; Thu, 08 Oct 2020 07:25:22 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQQIg-00066t-KK; Thu, 08 Oct 2020 07:25:19 +0000
Received: by mail-ej1-x636.google.com with SMTP id u8so6638443ejg.1;
 Thu, 08 Oct 2020 00:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ggIWyfuMBk6RIEocE2/Vctf1qOpbGaLGNz2DDI1RKQw=;
 b=uHE8Wbup0CIM3eJ/kouB5+KRgrfXOTnZ9ec9Im6DRs/o1QWIDqyOd2d/Cs0w/QFI/t
 mjA7k0MmdF24npFMSz4AKBeSbwNxVthW6C/Tj+21pp3VO+Iz6cXMdZqRstOcSeiPIt8+
 J8oPUSTCsmA5oCl/371oa6L8yQIeakvdE2IWUzLe/wd+WicX5btT/XxeS6K6Jt9tgD9p
 6E0raPiWjDAt8Dmun2jb+br2wnFGFfeVYPN8dhPzOOCPNOjCxgz8P0N4TGH6JO/f/Pzb
 /mOvLohinPNup/4JymI/wN56YHrkFwM6ijcDEkTgpezY9skOZjRtQOCo/KGGeJH2dYMb
 Llww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ggIWyfuMBk6RIEocE2/Vctf1qOpbGaLGNz2DDI1RKQw=;
 b=IM4VoPWUpeFpS69eNjyw9Qm5dVgBcbHr/ul9bt/4JRrL4FC+yGlGUaG5bgLFT4AA9T
 A+Bj0flyodFtfH3b4FBsqYGB3KLFg4uplFQpcP+XCrIlV2itj3h3f9bPwbhg3fwvTonY
 34qIbFsQwrSOh7AORgQ5ynnjuzarYot4Jr5ED8+PqEK2e5Ev62lBi3pGhsKwCqBTPg7p
 Yeof+B7KDxYAdp38sMVvZU2hvpQxO9xNBI4pfMsv4EBH3bsB1xUw38RUhIzSusDM/RBy
 sV34XrMegxdAg9wOvrKh12WdqP0cWefMGg9tc6xK3KOE+ijwQgN5pgijiQFKXrkr4yUI
 rOgA==
X-Gm-Message-State: AOAM532DZ3fps+TGKrWvyrccV/9Ika08bOQe/ooaRKXlnrKZAamfIasG
 jOuCZHfGROA/gsi0gjlyqrPIZHy7/f6SyA==
X-Google-Smtp-Source: ABdhPJyAgdoQHy9wC8IC8bDBnduHRYPjKutskcLbTeVUUhKov84Xic82qWyFgjQOprNIMpxV3JPDDQ==
X-Received: by 2002:a17:906:1957:: with SMTP id
 b23mr7210605eje.312.1602141916960; 
 Thu, 08 Oct 2020 00:25:16 -0700 (PDT)
Received: from ziggy.stardust ([213.195.119.110])
 by smtp.gmail.com with ESMTPSA id p17sm3370228edw.10.2020.10.08.00.25.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Oct 2020 00:25:16 -0700 (PDT)
Subject: Re: [PATCH v10 3/3] clk: mediatek: add UART0 clock support
To: Stephen Boyd <sboyd@kernel.org>, Hanks Chen <hanks.chen@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>
References: <1596115816-11758-1-git-send-email-hanks.chen@mediatek.com>
 <1596115816-11758-4-git-send-email-hanks.chen@mediatek.com>
 <1599546314.24690.3.camel@mtkswgap22> <1601719607.774.1.camel@mtkswgap22>
 <160212240863.310579.5253840355657757088@swboyd.mtv.corp.google.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <2a00b4d0-35ab-d1e6-0b8b-d4e0672e7118@gmail.com>
Date: Thu, 8 Oct 2020 09:25:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <160212240863.310579.5253840355657757088@swboyd.mtv.corp.google.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201008_032518_673790_654BD9BB 
X-CRM114-Status: GOOD (  14.84  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, CC Hwang <cc.hwang@mediatek.com>,
 Andy Teng <andy.teng@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>,
 YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Loda Chou <loda.chou@mediatek.com>,
 mtk01761 <wendell.lin@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Stephen,

On 08/10/2020 04:00, Stephen Boyd wrote:
> Quoting Hanks Chen (2020-10-03 03:06:47)
>> Hi Michael & Stephen,
>>
>> Please kindly let me know your comments about this patch.
>> Thanks
>>
> 
> What's the base for this patch? I tried applying to v5.9-rc1 and it
> didn't work.
> 

Can you please double check. The file the patch touches didn't get touched since 
v5.5-rc1. I tried to apply it and it didn't give me any error. I paste my way of 
applying patches just in case:

b4.sh am -l -o /tmp -n patch -P 3 
1596115816-11758-4-git-send-email-hanks.chen@mediatek.com && git am -3 -s 
/tmp/patch.mbx

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
