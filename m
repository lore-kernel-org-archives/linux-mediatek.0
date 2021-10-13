Return-Path: <SRS0=m4qr=PB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D1EEC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Oct 2021 16:29:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAB1060D42
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Oct 2021 16:29:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AAB1060D42
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nbd.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=u98eD5d5zA4TZc/2Hkg4hnYbgWjSrxjzigxqWUoUR7k=; b=IFFln070hP/lb1+3RjkzgdpDFQ
	rbCacu+qLEqzp21tUvTco7V2zph4462Q3z6Yprz9RbBo73Gv+SYqQ2BI0KV/0NCc45sBw+aE2Ilx1
	QTMVivoiBcZ2HVxwe1nRgNBySSBr7dCMUjcaZnIOUKAxtro/jM2gC8NUdZefnayBEAbUxYUMPq2Uj
	cJYxbLkbsbnPFJDwjjJqnoz7uHAw8PnjbJNHYLzqhGzkBo2ZDaBNX6fhcDxYd6NRL0YgZoC4aUt98
	4el3rE5qyA5KwjsxD4i+QKwklCbBeeJG3dhnZfvH1OUVsjT4hwg4PW97a2ZojSBxwQI9ot/hazqOP
	q5gYVF8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mah87-0002aZ-3H; Wed, 13 Oct 2021 16:29:23 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mah84-0002Zi-JM
 for linux-mediatek@lists.infradead.org; Wed, 13 Oct 2021 16:29:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mlfM8oa9U31hfMXaM65RvOi44aB/+9A6L1iUnZZ3ZTU=; b=dPZcXMu7exADgzHFL+Fc16TfRQ
 hxzij4CijQnaNlevD46C92byRMnD5t2FmOFNWnEmp0PCcHz9lxjhy7tOOn4wms/UfkRDKi99fcvFt
 lmFZOUM36z7h4fJHe2SDpV/tyRP4rBf5lAl6UXZgkEfsh3PcqhopqWuQmy0wzmHRnHb0=;
Received: from p4ff1322b.dip0.t-ipconnect.de ([79.241.50.43] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1mah7y-0000pF-6L; Wed, 13 Oct 2021 18:29:14 +0200
Subject: Re: [PATCH v2] MAINTAINERS: mt76: update MTK folks
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <eb888ae0e43a980c2c1aaed372a9b5e8098ea4ef.1634107511.git.ryder.lee@mediatek.com>
From: Felix Fietkau <nbd@nbd.name>
Message-ID: <fee064c4-b4f8-d6d6-1e9d-397e4050d513@nbd.name>
Date: Wed, 13 Oct 2021 18:29:13 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <eb888ae0e43a980c2c1aaed372a9b5e8098ea4ef.1634107511.git.ryder.lee@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_092920_899464_F4BDAAA2 
X-CRM114-Status: UNSURE (   5.97  )
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

On 2021-10-13 17:56, Ryder Lee wrote:
> Add more MTK folks to actively maintain the wireless chipsets across
> segments. The work is becoming increasingly complicated and various
> and we can provides hardware related perspectives to offload 
> Felix's workload, especially for the 11ax and upcoming 11be devices
> 
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Acked-by: Felix Fietkau <nbd@nbd.name>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
