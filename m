Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0A3C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Apr 2022 22:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KgWPAa9WvVQBdTVo3sYrpaArqLXP+TWPGJqqQSlByvA=; b=ETdVpqBLr5mcCb
	+uoqW290zCZDSr1bAh6jtlp6csigHZYexBvEa0bdNdJpG48Y79DO9Oi4cPjmCP2j0Vn9+yKDfQxW6
	aeOVP5kQStYqqZ9UKDLdVnMpKivS08SvhRKioRfc0vNugZQJP2t+p5p2tftsVvxcLOpcQ4B2zBnLo
	cMI/ZS2ZRqrGZZlMbiv2Ldgl5t1DowXtt6l+l5jvDYSG0VwY/zhiRY1Dl1QjCAjTFHPACiXmCIxv4
	1OjZbgWwwFqVCw9pSTtY1lvHV92+bk5v92MtnafdawXtmgNAhDC9K/bsxxXSOLa+bz1qdhCUtPVXo
	45sgD19d00DCdj8DKhDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nf7dR-007SYy-QG; Thu, 14 Apr 2022 22:08:17 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nf7dF-007SUz-Qx; Thu, 14 Apr 2022 22:08:07 +0000
Received: by mail-ej1-x632.google.com with SMTP id s18so12629801ejr.0;
 Thu, 14 Apr 2022 15:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :content-transfer-encoding:user-agent:mime-version;
 bh=a+eBKXg+HvEOWqCYxJUK4jczCUZDQAIkE1tarFAa5PQ=;
 b=POyZeHcWT1no5HjX1bNC8NvYTtOBHqFwIiC+OxkhZfXmSoyfEEq+yGr0w5GRkl+4M/
 cjAAzAbPkdKCUd78AbBDRBDKBws7momKROy6V13z74cZZ4HRfvaD9AlFYAb4NH7wb4s2
 9c8e/PSlXRnWz4MarGy5iIwMz3v0Zn+L9ink5i61suX7E0ZKfO6W6HE0BGdJiPhPmT6r
 EkFE89fAEraKstWMgYy+T6ExJmM6O060n37UVUIKhV2ML3EDO7peh0Ffv8lwu/+SA7xs
 6Dzq2ZyUNb7MOEzm8AFCqNGcLaBVxPjFDblAeDmrURkxTSEXf7TfzLX5LXh3OXv3IrQG
 uZqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:content-transfer-encoding:user-agent:mime-version;
 bh=a+eBKXg+HvEOWqCYxJUK4jczCUZDQAIkE1tarFAa5PQ=;
 b=6zMlMHZEAHf0znZqTfjN456Fd72BZTQWEM5uAhnzyA2n+jB3L9/Z3qXOXvJbC62blT
 BEevKz6GvpLKfT7fM9qlgUt/R+FcYJAFPcBT8n8MpZGoPPOWAcM3BE8jY4P9GDANcCd+
 Bz0G7EJuVGUMFMoBsvW8ZrU8d8OUE/BjE3YhOYe2odQD9LEqrIRZs526Yxp6Mx2uQuJh
 aYq58LO2lDAPEfEHxfGmh7y+IeC1wzqtlpjeZhClnvFyqtjp9em+N4TY8KaHB/iN8MOm
 DBJocIxouTLZjPbec9tOc5mSm+2krSqGjya/hj3VC4U0Dia3zhoyS5EpfRX/fEIGAP9z
 2hXQ==
X-Gm-Message-State: AOAM531gRsmcGoE08U238kPFOafPlapZbuH/f3Mod0X9nlnzTVCejfUi
 DSQPvXy35TBxZz8twqXQjrw=
X-Google-Smtp-Source: ABdhPJycg5sAyJlqC0y3pBXqqj2ZKaEeWREZOLjoq30ZvH+3SM9+ZvZB3WG6oizUmc1EycU86vYKXg==
X-Received: by 2002:a17:906:65d5:b0:6ba:3133:dfb9 with SMTP id
 z21-20020a17090665d500b006ba3133dfb9mr4135427ejn.56.1649974077944; 
 Thu, 14 Apr 2022 15:07:57 -0700 (PDT)
Received: from [192.168.3.2] (p5dd1ed70.dip0.t-ipconnect.de. [93.209.237.112])
 by smtp.googlemail.com with ESMTPSA id
 k15-20020a50ce4f000000b00420119333c1sm1687605edj.62.2022.04.14.15.07.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 15:07:57 -0700 (PDT)
Message-ID: <44108a7ad56dd6984523af35cfa003f4ed7be41e.camel@gmail.com>
Subject: Re: [PATCH 1/1] scsi: ufs: remove redundant HPB unmap
From: Bean Huo <huobean@gmail.com>
To: Po-Wen Kao <powen.kao@mediatek.com>, Alim Akhtar
 <alim.akhtar@samsung.com>,  Avri Altman <avri.altman@wdc.com>, "James E.J.
 Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: wsd_upstream@mediatek.com, peter.wang@mediatek.com, 
 stanley.chu@mediatek.com, alice.chao@mediatek.com,
 chun-hung.wu@mediatek.com,  cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com,  yohan.joung@sk.com,
 jason.li@sk.com, linux-scsi@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-mediatek@lists.infradead.org
Date: Fri, 15 Apr 2022 00:07:56 +0200
In-Reply-To: <004b55d8-fcd3-136c-526c-6ada025d6a1c@mediatek.com>
References: <20220412073131.10644-1-powen.kao@mediatek.com>
 <781bfe33efb1e44d22f71e6711da7d15be9d3ab4.camel@gmail.com>
 <7550da4043ae45ffd58399f1ee696238a5689f25.camel@gmail.com>
 <004b55d8-fcd3-136c-526c-6ada025d6a1c@mediatek.com>
User-Agent: Evolution 3.44.0-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_150805_897460_6722D149 
X-CRM114-Status: UNSURE (   9.38  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2022-04-14 at 12:49 +0800, Po-Wen Kao wrote:
> Hi Bean,
> 
> The general idea looks good.
> 
> As ufshpb_issue_umap_all_req in ufshpb_state_toggle won't actually
> runs 
> at cold boot probe due to the fact that sdev are not present yet,
> this 
> should avoid sending HPB command before UAC being cleared while keeps
> HPB mapping clean when rest flow occurs.
> 
> Just a concern, shouldn't ufshpb_issue_umap_all_req be send for each 
> sdev's corresponding hpb?
> 

Hi Po Wen,

I replied in another email that setting the flag resets all active
regions in the device, which is a more efficient way, I have submitted
a fix for HPB device mode, your review and testing are welcome.

Kind regards,
Bean

> Looking forward to your further fixes.
> 
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
