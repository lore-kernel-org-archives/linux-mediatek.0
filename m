Return-Path: <SRS0=AAZc=AL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 356EBC433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 21:42:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFFBC2065F
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 21:42:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Vo6Xgl6e";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="jyYJZQ9M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFFBC2065F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lHBdONV1E9JQN2zNELRY/ZBk25APrmJ+D9CSd5lnIdg=; b=Vo6Xgl6ekwfZ3Z0dXYOpusxZ7
	DsLM9M7Syj4IwYZD9C9bWNS1AvjJSk5zKCY2vGKsibzAFHyoS04zqBJgBymSe7kFRPGH176OQfSwW
	Q+/gYy+vW6tULY8yanOPI2//16Jya4GdRPehaadzklMPJ7GTWwvnHlQhcw5aN8OO7DRlpkjNizZ+P
	nXnDKIQCklX/Mogv9plv4EExJy2uC9Re8r3gvDskhxIRK3dNtYwIsAKLPw7QM6uhj1vtkA4uP6L8s
	Cxn3N50vRiaQ6jGZXOItrK06SGHT6U9iW6kRLub6LAmhvq1vfTbIg2kVJb8bh8CnQA62LvlI5Mde2
	DEiqsIJdA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqO0x-0000w6-8x; Tue, 30 Jun 2020 21:42:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqO0u-0000vM-S3
 for linux-mediatek@lists.infradead.org; Tue, 30 Jun 2020 21:42:01 +0000
X-UUID: 87a5fef960f54e6cb00ee22be22ddf87-20200630
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=my6niiLx0nSCCSrHDeMum2DvSxJq/ewHLuqNctNA8Dw=; 
 b=jyYJZQ9M9uLaWb8ieiKNYR3VipyDLMNsHY6ZZ3DT67ZbfhbWLYZCFjLx/tMeCU/lSSQcj33HWFYZ30MQ0Zf+UDL5sgL9nl4Cbd0wVzJENpgzE7mf/BnWIPpYZfBwp4CSMZzIrX4EvSsVkI/gsMJigXODK4FGQa5IOoGSC7KvnTA=;
X-UUID: 87a5fef960f54e6cb00ee22be22ddf87-20200630
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 478572025; Tue, 30 Jun 2020 13:41:55 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Jun 2020 14:41:53 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Jul 2020 05:41:39 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 1 Jul 2020 05:41:36 +0800
From: <sean.wang@mediatek.com>
To: <lorenzo@kernel.org>
Subject: Re: [PATCH 1/3] mt76: mt7663u: fix memory leak in set key
Date: Wed, 1 Jul 2020 05:41:37 +0800
Message-ID: <1593553297-25352-1-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <20200630072429.GD2169@localhost.localdomain>
References: <20200630072429.GD2169@localhost.localdomain>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2C9B81AFE1CDC18AA22159E30B7F248C76E4B6EC919E3865F543F070162C8ACD2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200630_174201_066153_B32980D9 
X-CRM114-Status: UNSURE (   6.55  )
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
Cc: Ryder.Lee@mediatek.com, Sean Wang <sean.wang@mediatek.com>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com, nbd@nbd.name
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

Thanks, I'll have the next version to remove the unneeded kfree.

>
>> +
>> +	return err;
>>  }
>>
>>  void mt7663u_wtbl_work(struct work_struct *work)
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
