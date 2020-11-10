Return-Path: <SRS0=XLXJ=EQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C26E9C388F7
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2020 10:50:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B620205CB
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2020 10:50:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e/phxJ74";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FrhFbwdH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B620205CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9qpAuK+0FHmUqWOxIwNqlgtcy4d0d5LerZziceK6j7Q=; b=e/phxJ74d4VQPwNOXMWT5DxWR
	Hijiu+K1nVR0APZMgsUnHBgGG5i1MtZvFa+jarIzsX1nBCNK8da5vFL5/O03AxIPHODebKA54eTRK
	EuDUvjhKbDWLRkxcyaPNq2pEWzrNQDM1O/A/17ky2UtmS2O2hUheSRMgrqdK+wS88cLqjgsE+sRRj
	Q1G+5smAynae1WKrdaf8dyuigSqcWjFDht3A/lRvQlxosau+HDg5oyUWaRKor2naJWGa9UNGSrDE/
	JXVK9wjd4J+3W5UJL4tnTCKiFXcpnQlH5wJojWS26QtBa5BBBC2nReTrxYaXq3ChdmEBlbYNv2p+4
	wu86QB/Yg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcRE7-0007FW-6o; Tue, 10 Nov 2020 10:50:15 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcRE5-0007E0-CP; Tue, 10 Nov 2020 10:50:14 +0000
Received: by mail-wm1-x342.google.com with SMTP id p19so1738786wmg.0;
 Tue, 10 Nov 2020 02:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RI3echpmsILHMbwDzAgMqcqkjUKk2AOhPsGaeepkNKI=;
 b=FrhFbwdHS6/kq3jq8MO8bIfVNpx/tqWrlhlOsA3bKsZghA74MehbDZoUkpZHwRJM9j
 4g0/JpvOD6J4nGOkh8cLPQG8LK5xHzSP2efrQ+y8UBN7JoBdflYvnLUmqWWmaVOa4XZh
 HJZP5sqeRG/lRZAvH5YMsdwOxr8dsfPsTrSV+0kJVaPP2Ecm08KQRP1Q6QfUI8+E6gRh
 uxcowjkBfnD69wwWMgU+E9/miAGpncdYoQGEt2jhyNckw77imOXJ9qirusZt4ptHaADF
 6SU7wyJzV9+k5IccBZ+nfFT984BpzWZ7p//S+aGMh7NuoIgFqWHshg9WYhW7ahC++LXd
 yBzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RI3echpmsILHMbwDzAgMqcqkjUKk2AOhPsGaeepkNKI=;
 b=FjXKO930WpRhAYtcObDSsZ9e6J1Nv7/mT4gkQoO4wgYlUU08F0QwX95fGLJs92rdMV
 MZS/A4ob52ukBD2vYdo4M9+StWt++wtKbFgOnvmPuAq/fo0CR6GSPe0S0fsPeuAgOgiT
 w7F+U74p/DIMr4x8HpMrJWnCpMxeubrwfw3Nae/IoBIRwDyeyjLEimc5SDf9OGzMAOIk
 EyBU1+mCX4Rs+dnj2xruQXUvxC3Orz7KU5tELEyqFYQOMFpFKRBmnqRcrco5zIp4bo1X
 0I6cMRygXCGBnGdX19+RL/bDcuZ5PD4KhWvAzybDzpUVnxvRB1BtkOT33KR0g0AmF12d
 YViQ==
X-Gm-Message-State: AOAM530S2Vr0gv+EeX+pwpYlPhC5inCWeqzFzgnrepQjFte/gdFx0Hrt
 RUAtObbZhC/HAdPtpM9wBRE=
X-Google-Smtp-Source: ABdhPJx4aH/axjJpFpDOjbOiN8JuiZiLYbtFxERcm0uuN9Xjc0uKWDIuFz8ESgqBpekhNRBqg9O1LQ==
X-Received: by 2002:a1c:9652:: with SMTP id y79mr4175402wmd.71.1605005410743; 
 Tue, 10 Nov 2020 02:50:10 -0800 (PST)
Received: from ziggy.stardust ([213.195.112.112])
 by smtp.gmail.com with ESMTPSA id m20sm18743080wrg.81.2020.11.10.02.50.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2020 02:50:10 -0800 (PST)
Subject: Re: [PATCH] clk: mediatek: fix mtk_clk_register_mux() as static
 function
To: Weiyi Lu <weiyi.lu@mediatek.com>, Greg KH <gregkh@linuxfoundation.org>
References: <1604914627-9203-1-git-send-email-weiyi.lu@mediatek.com>
 <20201109102035.GA1238638@kroah.com> <1604972321.16474.9.camel@mtksdaap41>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <00a5aabb-b478-66e0-0663-3cf5557e861b@gmail.com>
Date: Tue, 10 Nov 2020 11:50:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1604972321.16474.9.camel@mtksdaap41>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201110_055013_498374_E854E264 
X-CRM114-Status: GOOD (  19.29  )
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
Cc: srv_heupstream@mediatek.com, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Owen Chen <owen.chen@mediatek.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 10/11/2020 02:38, Weiyi Lu wrote:
> On Mon, 2020-11-09 at 11:20 +0100, Greg KH wrote:
>> On Mon, Nov 09, 2020 at 05:37:07PM +0800, Weiyi Lu wrote:
>>> mtk_clk_register_mux() should be a static function
>>>
>>> Fixes: a3ae549917f16 ("clk: mediatek: Add new clkmux register API")
>>> Cc: <stable@vger.kernel.org>
>>
>> Why is this for stable trees?
> 
> Hi Greg,
> 
> My Mistake. Indeed, this is not a bug fix for stable tree.
> And there are simple questions.
> Will I be allowed to keep the fixes tag in this patch to indicate the
> mistakes we made in previous commit if it's not a bug fix for stable
> tree?
> And all I need to do now is to remove stable tree from cc list. Is it
> correct?

That's my understanding, yes. Keep fixes tag but delete cc to stable.

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
