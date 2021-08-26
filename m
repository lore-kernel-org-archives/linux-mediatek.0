Return-Path: <SRS0=zgIi=NR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EFB2C432BE
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Aug 2021 11:29:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE03960FD9
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Aug 2021 11:29:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DE03960FD9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LqxFi8yv8avkjYqVitGxf0Jq79X4kYrRWDrTyvdB4vo=; b=vDSny+kOirSeO9BuX6l6maymLW
	h/tjWNhFZRswuqgIw7ByyfCl/SI4gGNv9JlW1I/Un9qVRPJ3dvq5NOBo0EIT6WZOm9hICzye1tNOQ
	9K61DDx35m9uRkjh37xdgBSjm89j4bcZahZGAA7DP4rfoyhUxihhXs/Yi7NQ5Kvhc80wHDRlFGsfm
	gPpdzN03JTi8QufIi+cfAHMv3RXHau2REWoc01xT55Qk5akgm12YZn+YLUmdeDRJi47f3MX9QmzYr
	re3fETDkiDc7Yk8juN85UBSP3J6jt8lqgAKxAalqFd2ovrbHEnDL+yDjPT52OpeEJJefGfRNGjMa0
	8/BfGd1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJDYx-009upq-G7; Thu, 26 Aug 2021 11:28:51 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJDYf-009uhO-4X; Thu, 26 Aug 2021 11:28:34 +0000
Received: by mail-wr1-x42f.google.com with SMTP id v10so4509922wrd.4;
 Thu, 26 Aug 2021 04:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=L5cag9XJVl6CGutNwpSZlwmS3o3RmhThsalx1g1IrhE=;
 b=kATmy8zwa/wv9K4EFdVfOg6mUVsMmKNLSmp32Dly7sguCSunX2BgRQ+rlo5ngrzt7O
 R/APzCryqfQIwjrBS5jYZTlWpt4bGRcocN4kuk7XORZF/xTY525YHwntwzd7PsGeiZht
 1DUOOpYUAOU1BlgbDhZ1SN43crhC5ZYn/WTgPbKkhCOKbLbl3jJon137cak0gh5WidFy
 SQpb4snHqz+RBX3fTDiLwRoyCNTXe9yeaUIn0QB0DQiufVqwn+co7UjKCoFeRnJUHRWe
 LUJqKze7Ev2VZ4KcNhJ7Z8Q8kViGin0080Zgc1ixx1ffH98PyFCppfJa43SZ6ocUrop0
 dW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=L5cag9XJVl6CGutNwpSZlwmS3o3RmhThsalx1g1IrhE=;
 b=jMcq+9vrJ0bf76sBJrE6J4c0deQh1RayNqixPRlgd9Joj2UT3yr7UdjNjDugXG+na2
 6rzDd0ZvkSxcieVAy+ZJkVn16wkSq++d6ST0AfQa4B5wY1XepU/1pIA+VQ5evVmkYANE
 2oEn5b1tRmDRQf5/dJXdOf1JGZaMn4oaJ4SDGmFyozFTYM5nNFOPjJMDTeo9xG4JH50j
 d0nfc98YE3CiGPGk2p8km5SHNhgDP/+GhTcLD3mKTt9pEkyPuwPuf1ywEUokLdUTenoi
 S5RijqJw8dmWB0in0jxVaDiMrPEjYK9E3gB71L/NgdWWIreaCa2TktYYJqme6kPsc9MC
 5+Hg==
X-Gm-Message-State: AOAM530tnyOgxzc62LGuK/0QuPbKmL5fXlMcJ51VwPmqBHrBE7LC4mhW
 xWrBO/Jb/RuQFopykvhfwyYidLELTtiYZg==
X-Google-Smtp-Source: ABdhPJzTjaG3Csn2Yj/NA3ZQsg8Vit7gaAMhO4wYxTHEppDr8F+25UU9HnTFjqGhOluAy4YTKTHxQA==
X-Received: by 2002:adf:c381:: with SMTP id p1mr3319892wrf.163.1629977310446; 
 Thu, 26 Aug 2021 04:28:30 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8192:e700:d55b:a197:684c:2cfe?
 (2a01cb058192e700d55ba197684c2cfe.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8192:e700:d55b:a197:684c:2cfe])
 by smtp.gmail.com with UTF8SMTPSA id 17sm2352534wmj.20.2021.08.26.04.28.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Aug 2021 04:28:30 -0700 (PDT)
Message-ID: <4b61ce72-87ec-cf8b-9f71-67eb329a9ce6@gmail.com>
Date: Thu, 26 Aug 2021 13:28:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.2
Subject: Re: [RFC net-next 1/2] net: dsa: allow taggers to customise netdev
 features
Content-Language: en-US
To: DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20210825083832.2425886-1-dqfext@gmail.com>
 <20210825083832.2425886-2-dqfext@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20210825083832.2425886-2-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_042833_229955_6F0CB57D 
X-CRM114-Status: UNSURE (   7.82  )
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



On 8/25/2021 10:38 AM, DENG Qingfang wrote:
> Allow taggers to add netdev features, such as VLAN offload, to slave
> devices, which will make it possible for taggers to handle VLAN tags
> themselves.
> 
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>

Besides transmit VLAN tag offload, do you think there are other netdev 
feature bits that would warrant something like this as opposed to a more 
structured approach with adding a specific boolean/flag that is specific 
to the netdev feature you want to propagate towards the DSA slave_dev?

Still:

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
