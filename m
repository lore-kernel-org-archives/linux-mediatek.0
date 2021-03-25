Return-Path: <SRS0=z/aX=IX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E489C433C1
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 22:42:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5813C619E8
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 22:42:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5813C619E8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nbd.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Act3RbASJ0V02xksxBcDrHgRknGshjYvIsLopsJNZcQ=; b=hoC30wegACzxQEPWrkKn9QSSJ
	0ZtbcNlDFLhE8We4B9G0r3Wqp/qIoBQozB1oZrBIv9biycBI5dSAPiTu9jHl6sEbdshq3ThBs55jt
	UYNA8zuwFjakj0nffDFI9iiiEULDAI5lNlvUQUx0C39HspHZAbdxqkEYRKbb3Ut69W0d+age2iz1i
	Uktyp1enVtQ4wwR2VaoZdj/uPT1OSj95ZfBcx6olieBawhghdyn/crbQX7zabjQEyr18QfWbpXueB
	Te7o5NP2NbC1Lmc+sO68Aq4g++TfvOM5IpYgc+1iMeHd0mveEObxPuRJvqJloe9CZcEVE/65wjR3r
	/lj9v5ofw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPYfo-002ImX-7X; Thu, 25 Mar 2021 22:41:53 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPYfh-002Ila-S7
 for linux-mediatek@lists.infradead.org; Thu, 25 Mar 2021 22:41:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VtXEnQZ9olnrM7GqKQU9RM4wafpJF+GH3/7KLt07cUU=; b=ZUvmrPBMEQDy9W+QUjc9igwsjV
 HT4WRoWw7U3cglpsCDqbnsNnlE9AYG2P6hB9UFr8rOW/QQ+mjqmw0xpid52Jn7dv4w27biTJhozL7
 dHkWl3eaTkrpCF3HqiJLBmmNz3hGW4N7Dgsd3aWAObnEfwgACEKxt6rqaOJBP3ieRFSE=;
Received: from p4ff13c8d.dip0.t-ipconnect.de ([79.241.60.141] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1lPYfe-0004gJ-LN; Thu, 25 Mar 2021 23:41:42 +0100
Subject: Re: [PATCH v2 1/2] mt76: mt7615: cleanup mcu tx queue in
 mt7615_dma_reset()
To: Ryder Lee <ryder.lee@mediatek.com>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <fdde0eb8c6dea0e81b5f5ae528085f1ccf53fef3.1616696376.git.ryder.lee@mediatek.com>
From: Felix Fietkau <nbd@nbd.name>
Message-ID: <750b96aa-f26a-5c2a-7040-4bb84a7aa6a7@nbd.name>
Date: Thu, 25 Mar 2021 23:41:42 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <fdde0eb8c6dea0e81b5f5ae528085f1ccf53fef3.1616696376.git.ryder.lee@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_224147_218499_4527E2BD 
X-CRM114-Status: UNSURE (   7.16  )
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


On 2021-03-25 19:28, Ryder Lee wrote:
> Cleanup ext_phy and mcu tx queue so that mt7615_mac_reset_work() can
> recover mt7615 normally.
> 
> Fixes: mt76: e637763b606 ("move mcu queues to mt76_dev q_mcu array")
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
> change since v2 - cleanup mphy_ext->q_tx
I like v1 better, since ext-phy tx queues are the same as primary phy tx
queues. Or am I missing something?

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
