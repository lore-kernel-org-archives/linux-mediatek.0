Return-Path: <SRS0=xI6Y=LQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 552D1C2B9F4
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 09:15:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C841611AF
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 09:15:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C841611AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LLv2fNOHXt9AFJXVD0XFF2aFWyNzYJFhf5/hjIdwmhI=; b=PKzJxoDxxUeoED
	T53DgjuCHo6XTIQtKnvuk8buA2aiN2MTxII1qCBdo30o7ceUzS4+k9iUvs1uS+OP/ekiUOujEzC7g
	NG+Y+1IjobqbnmgU6G5HNbfYT3vxt7zXxyh9K18Lrs8wGCWyh7VwsMHJXLPd0HfoEuNV5tfV8Cmjr
	Abe+gvn1fCou9y0Aj+wDqqwiyg+VDSCaw8CkmL/119qsSooL2ycIWM0axsFt0l78NHqrFheo9X+xx
	MUw01K+BvPT8ALzRdpj/QG9vIYqbLp/ItC5yJvbgKpCiMNiVzA6/ElZ445dR+OfLJPNj3HvvHyvLi
	ej4AgIxhBS8vh/7Km51g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvcV9-006NbG-Tw; Tue, 22 Jun 2021 09:15:23 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvcV6-006Nad-IX
 for linux-mediatek@lists.infradead.org; Tue, 22 Jun 2021 09:15:22 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1624353319; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=6oUBBn3WS5kQlwI0hR7nJNfKpU1hm+VGgC+xHP3tpDE=;
 b=Bp0uzdB64szMxIY4rRZjcAOcZB+kwNBPyA4HI5FwoSyIxAmI6s0iL/T8CvYpMD5cnBu9JIbI
 6zs8gx1tgHhO1oiC0mGVt/U/FyA8eAsVzvkJ+rpAF06Ergi7BH4VjhnXQO/Xblulfe5pObJs
 Q+8MaRtjgomx1QaRf36N16W+T04=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 60d1aa26ea2aacd729b3a3bc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 22 Jun 2021 09:15:18
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 41C43C43460; Tue, 22 Jun 2021 09:15:18 +0000 (UTC)
Received: from tynnyri.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id CAF1BC433D3;
 Tue, 22 Jun 2021 09:15:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CAF1BC433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: sean.wang@mediatek.com, nbd@nbd.name, lorenzo.bianconi@redhat.com,
 Soul.Huang@mediatek.com, YN.Chen@mediatek.com, Leon.Yen@mediatek.com,
 Eric-SY.Chang@mediatek.com, Deren.Wu@mediatek.com, km.lin@mediatek.com,
 robin.chiu@mediatek.com, ch.yeh@mediatek.com, posh.sun@mediatek.com,
 Eric.Liang@mediatek.com, Stella.Chang@mediatek.com, jemele@google.com,
 yenlinlai@google.com, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] mt76: mt7921: enable aspm by default
References: <9b704807383f3048898944d2b9cb74e6b4e8d83d.1624174954.git.objelf@gmail.com>
 <YM8N7BRIk5QzaEZy@lore-desk>
Date: Tue, 22 Jun 2021 12:15:10 +0300
In-Reply-To: <YM8N7BRIk5QzaEZy@lore-desk> (Lorenzo Bianconi's message of "Sun, 
 20 Jun 2021 11:44:12 +0200")
Message-ID: <87o8byjm5d.fsf@tynnyri.adurom.net>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_021520_726143_86C04A1F 
X-CRM114-Status: GOOD (  11.80  )
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

Lorenzo Bianconi <lorenzo@kernel.org> writes:

>> From: Sean Wang <sean.wang@mediatek.com>
>> 
>> mt7921 is mainly used in NB, CE and IoT application where battery life is
>> much concerned so the patch enabled PCIe ASPM by default to shut off the
>> clocks related PCIe as much as possible when MT7921 is either in suspend
>> state or in runtime pm to lower power consumption.
>> 
>> We still leave disable aspm as an option with module_param for users to
>> disable ASPM if necessary.
>
> instead of adding a module parameter (deprecated)

Why is a module parameter deprecated? I have not heard about that.

> , why not just enable it by default for mt7921 and add a debugfs knob
> to flip it?

debugfs is not ideal for this kind of hardware configuration as debugfs
can be disabled. My preference is to use a module parameter.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
