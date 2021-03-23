Return-Path: <SRS0=7DfI=IV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 445FBC433C1
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 09:07:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF12C619B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 09:07:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF12C619B4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DUMB7moShhnoj4I/Wl2ugEtX6yWQfhbN+PSs/tCnQ3Y=; b=LIi4aVbn3yiZLIy30w4oH22ju
	RYiRjllF3T5XUFrAuFsj++xATXhewHE0TQ/ZKP0NbKuHrzxLyUvARNA64+6iB9IY/D3jl/mkpDSde
	8yHqp2PSITxhjk9hlnWjzMGSGlBlKQodYhVOdp1a/dQHTRQww3c7MpGyM0QZhGY/1OUhSNuzgfN/N
	7NwJNP3RLFeU4/Xg3bBerlKhrndAtObTicNMnpu6OjcE6u/JSYYfyFgsHDRwejDQtB0XBAsz+V3Ar
	+KFVQbbJDef05o0/XHYwiWlzM+LXgEwB/3zpunr5yOEpGs3Sw4/dFWkNRhhf6HK5BZx3tPN7zGzfG
	Rpjtf2zEA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOd0e-00EOjB-VT; Tue, 23 Mar 2021 09:07:33 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOd0Z-00EOhd-ED; Tue, 23 Mar 2021 09:07:30 +0000
Received: by mail-lj1-x230.google.com with SMTP id 16so24573569ljc.11;
 Tue, 23 Mar 2021 02:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r5SAZtnTWXxLSfp5x9mNUDN04JTLz5IpjnjCJ8TVqCM=;
 b=f7jt0gNGdizSy7AGbY2k+u1IwC505G9TcJFzN1tTZUMKMXLOTQYbac9XtjIkO2QYI8
 lmtO1uRyQwnbY8NoZVFJ0+kAz8Ci3dyRHLhXF1yt6qL1n9jqqhDUSQ93oqNSKNCQj81J
 491VFyZmtOTzNRDsjUAkTCG+0bQToZ4iYmPrcyQkwHkvWD/HUmEXpBVnMzCN33X3spO4
 I9zubvfpLWhHk+9hyoPTisPIWBTGoKlLdWWEZo+Eig+rtlmgtXD6Tdbn7Rv23iiTxLD8
 Hh4lNfnjQrx/4dCACveqq5BVnWbB0DcYWMPL8rZDheJuH1h0raS8zl8EulAySsyYYpY9
 XdKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=r5SAZtnTWXxLSfp5x9mNUDN04JTLz5IpjnjCJ8TVqCM=;
 b=KEfFqd3/FsbGC8b29B0zmiEI2i+v+5OCumT3LadVEuNH6JPLW3EK0lw/i88IU0r3nz
 +czEKIah3jFbOkM/YxUU74O3TBjH/bBKdJ05PHogb6i97UPDJpoHh+OzonnuUhQv7IrT
 iywwZoTp1ZfjA7OLKmjl0NaZ3hlgSRfNXM5ZRmwI1Hoa3bCK3HJCMn+/dsBD2S4+FFq2
 m3e4CO4heaPz/73BqJ8KQIk+hiUmWRIwDEusgvMr4kRstYu/YVNaIKb+KvWIulY5R1ge
 VCTtBYlAEGlM6DS4oisfcjFNjwspHCFo+syxi3075xHNe2/hH0/w44vvdIagNZaK1fyb
 wufg==
X-Gm-Message-State: AOAM531UQ/1VwLMUSFcN5Etxtm8He7G51LjHxH2+Pr0SrtzndhOHezhc
 ul5QyS415GOIEUdrDxM4zGI=
X-Google-Smtp-Source: ABdhPJywmUTFte0z9HFu9YRNCVTTVo/LOl4cWWDaRUxplW0BJuLorXxwUvKRfJ+EOuEmKfuUS07jMA==
X-Received: by 2002:a2e:2d02:: with SMTP id t2mr2426043ljt.488.1616490445739; 
 Tue, 23 Mar 2021 02:07:25 -0700 (PDT)
Received: from [192.168.1.100] ([31.173.87.52])
 by smtp.gmail.com with ESMTPSA id w24sm2251214ljh.19.2021.03.23.02.07.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Mar 2021 02:07:25 -0700 (PDT)
Subject: Re: [PATCH v2 01/13] dt-bindings: usb: mtk-xhci: support property
 usb2-lpm-disable
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eddie Hung <eddie.hung@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>
References: <1616482975-17841-1-git-send-email-chunfeng.yun@mediatek.com>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <32d4b418-a078-560a-2b65-4a80a2869aae@gmail.com>
Date: Tue, 23 Mar 2021 12:07:17 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1616482975-17841-1-git-send-email-chunfeng.yun@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_090728_809805_8BE2920B 
X-CRM114-Status: UNSURE (   7.13  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello!

On 23.03.2021 10:02, Chunfeng Yun wrote:

> Add support common property usb2-lpm-disable
              ^ for

> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
[...]

MBR, Sergei

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
