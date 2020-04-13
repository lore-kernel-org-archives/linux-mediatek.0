Return-Path: <SRS0=tzuU=55=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BABCC2BA19
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Apr 2020 06:48:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DEB920735
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Apr 2020 06:48:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e3Pg/WPy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Ce1jEqSl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DEB920735
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZaMMqDBEQOuqUIW6qD2XlzaL8FdJQ1jAay4enHVoi/g=; b=e3Pg/WPy03HdAAoGhBoNwYSLF
	jF/SNDSTszz6qtPMhPh6KWZVSPFc88ZTPELiv3SgDfowiSaMTxmV/8zXilkJzyWn8ah0Eu8N1lTSi
	S9wwDVpCVgrcMQBI+Bxvh0USoKQZ1jST4n4WL5xQmCvITlIYa0hN8uIDccoPwUcEH9Pr3DTKQN+q+
	B53XnzKn8KlKAabSOPDObiE9ybIidsNjbOTHbQaRz8EDXaQTS5El7XPAJtj+LIRe+FrbtiA4JA2g+
	SIGvxvaY0WvLT8VqxGIz9VR4/TmoGdWLPGcI85S95wpilDcPgFeP23cm4fo1fhPT0sLuK3FUCX7sC
	zS1nQa6VA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jNstZ-0008Ff-Js; Mon, 13 Apr 2020 06:48:37 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jNstX-0008FC-Na
 for linux-mediatek@lists.infradead.org; Mon, 13 Apr 2020 06:48:37 +0000
Received: by mail-pg1-x541.google.com with SMTP id d17so4097745pgo.0
 for <linux-mediatek@lists.infradead.org>; Sun, 12 Apr 2020 23:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=V8FxIiIa/TXjm9S7utiVILgjnG/f48VqNhX4GcVaXLg=;
 b=Ce1jEqSlokrDGvunDyR9bUnACrg2o9q4WoKw8vdKFYCfyg3g/5USrGD1A77hxvB1HP
 omJmvefIBSa96+MPVFLzPjA/AGPrg8Bnt8bUgcveM4nSd6x/S2VF0GdiurQNp1yXH550
 tGtDnDiBrpntUr1J9Ex2Qg+5wpzzgr+RsDibI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=V8FxIiIa/TXjm9S7utiVILgjnG/f48VqNhX4GcVaXLg=;
 b=VYjzByIpGz7ieJS883Pt+WWrabnZNmCZ33xjDJCB6HRccAjuH0Qr2dMo9BWjcrvP8r
 +Jx5guWBcCBTKhQwmjwJ1Wa8mfCMaH7DAzbRBl4roel3myIWpbMjTUcBSGiFzPFp/wPR
 9gxmn7J0aD1xq48Rcu6v/I3HJu1u1KrJ+QrnP4HEMbreeXmY+cZl02MTkEFrhihLDuZD
 wfCjHGZmqrhwUveOmh6gSbOdFQUhQYZKEUlfflP6f4fhMy0VYNt5Ez7vSZyQdYrUSQe0
 1ggh/ExSqCpQ8A/+8KkhQrXRPzurireiFObbuI34MMvaYpD2rx0k1slaumE1EsEXrCNl
 6sLA==
X-Gm-Message-State: AGi0PuZLixDsQvE9y6der85JC71k1wn/5fRWzoSAwjb1d9vNP61b9xhK
 AcgJ5ViaLbJgWX3n/saUKiJ+Q8wIYzDomSGD044pkO5gDLyMuLpda4b/hrVBYqkJmdgGJg5Vwrd
 S2vj85ImoNWj21glXHEpJVtwAwXfWsn7WmZcFK7nBO2ASHsYcafY3VkAoZCya6De4S6AgCUE8aO
 Mi6KUBGvV54Mm7xV4fLLAoqg==
X-Google-Smtp-Source: APiQypIuKwXBc5IZrT2akRd5a0qulCuzNCYzkFYFYfzP9gKlFYaVdqhzy5UfOrYjYn0oPZPPu1K6ew==
X-Received: by 2002:a62:164a:: with SMTP id 71mr15651380pfw.273.1586760514160; 
 Sun, 12 Apr 2020 23:48:34 -0700 (PDT)
Received: from [192.168.178.129] (f140230.upc-f.chello.nl. [80.56.140.230])
 by smtp.gmail.com with ESMTPSA id y126sm2703268pgy.91.2020.04.12.23.48.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Apr 2020 23:48:33 -0700 (PDT)
Subject: Re: [PATCH] mt76: replace consume_skb with dev_kfree_skb
To: sean.wang@mediatek.com, nbd@nbd.name, lorenzo.bianconi@redhat.com
References: <b90644567e758b5702e37e34e31f2007e3bd2c87.1586290996.git.sean.wang@mediatek.com>
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
Message-ID: <b1038177-4ed0-93fe-a093-a9278412dfd8@broadcom.com>
Date: Mon, 13 Apr 2020 08:48:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <b90644567e758b5702e37e34e31f2007e3bd2c87.1586290996.git.sean.wang@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200412_234835_769841_E0D4C11B 
X-CRM114-Status: UNSURE (   8.50  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-mediatek@lists.infradead.org, ryder.lee@mediatek.com,
 linux-wireless@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 4/7/2020 10:25 PM, sean.wang@mediatek.com wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> consume_skb is identical to dev_kfree_skb, so that replace consume_skb with
> dev_kfree_skb just to make consistent in whole mt76 driver.

Given that dev_kfree_skb is a define that maps it to consume_skb I would 
say the use of consume_skb() is preferred. So maybe better to get 
consistency in the driver by replacing dev_kfree_skb with consume_skb.

Regards,
Arend

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
