Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 835A9C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Nov 2022 09:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g6MFH1scv5uKbfQTXIbowtuwn/4+2Qeygz1VdwFcDYg=; b=19sTKHp3wN/O8n5JblP7ZpQfO4
	EFsfDrP7gN/umJY3M7Gash3l5EoCxUQ2RosLizsrKtXd0lhi/H7uLnjS+aLbPRzIkzlNfFbzcKFOn
	4GxorcIrDxAgarben9WkoOQJhnox6F+C47SO8wnX2ViXk+E8utLlPIr7xpjqdYk//OxlWojVsPq+I
	/psuN64HvgBxPzZ18Qnn29/hyo97Mw6VuPfKU5qIQ7wh9wokArZ1XWfrIbV+v9BHhgLIZ4Cd9hthj
	WXo2vFbrYAlqXNM83SE5wbFDDqJpBG0P2kVNA/bHQ0wY4vBEuyQKnWFUxQw1HkTwE8rN6KarEmKs3
	5goZg9aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozaPb-000dEf-OY; Mon, 28 Nov 2022 09:26:51 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozaPY-000dAP-Mj
	for linux-mediatek@lists.infradead.org; Mon, 28 Nov 2022 09:26:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=g6MFH1scv5uKbfQTXIbowtuwn/4+2Qeygz1VdwFcDYg=; b=n0ZjmQdSCitDeu367PSL5NciQR
	+GNNftLYUTAycdBTYVhXzrUuzTHoDvILYKpGq/8m8bViZ+N9zgTZyYayWKsTHozKICY1amdhv+f9M
	I4JGYNnsnQ3LHhgRq4+8nnFO7higw8eEbwBV9QjE/pvGF3VetksN79+eTf6sqXJUoND0=;
Received: from p200300daa7225c0824436b361c345cd2.dip0.t-ipconnect.de ([2003:da:a722:5c08:2443:6b36:1c34:5cd2] helo=nf.local)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <nbd@nbd.name>)
	id 1ozaPL-004ytl-1G; Mon, 28 Nov 2022 10:26:35 +0100
Message-ID: <14f4381a-d424-f84a-bc85-f4b25e6f1641@nbd.name>
Date: Mon, 28 Nov 2022 10:26:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH] wifi: mt76: mt7921e: introduce reboot notifier support
Content-Language: en-US
To: Deren Wu <Deren.Wu@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>,
 YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>,
 Eric-SY Chang <Eric-SY.Chang@mediatek.com>, KM Lin <km.lin@mediatek.com>,
 Robin Chiu <robin.chiu@mediatek.com>, CH Yeh <ch.yeh@mediatek.com>,
 Posh Sun <posh.sun@mediatek.com>, Stella Chang <Stella.Chang@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
References: <28482de35c4f1589dcf96b662a48bc558fe46e8f.1669361180.git.deren.wu@mediatek.com>
From: Felix Fietkau <nbd@nbd.name>
In-Reply-To: <28482de35c4f1589dcf96b662a48bc558fe46e8f.1669361180.git.deren.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_012648_854203_BE583DF8 
X-CRM114-Status: UNSURE (   7.44  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 25.11.22 08:36, Deren Wu wrote:
> From: Leon Yen <Leon.Yen@mediatek.com>
> 
> Some combinations of hosts cannnot detect mt7921e after reboot. The
> interoperability issue is caused by the status mismatch between host
> and chip fw. In such cases, the driver should stop chip activities
> and reset chip to default state before reboot.
> 
> Co-developed-by: Deren Wu <deren.wu@mediatek.com>
> Signed-off-by: Deren Wu <deren.wu@mediatek.com>
> Signed-off-by: Leon Yen <Leon.Yen@mediatek.com>
This doesn't just affect mt7921. There are some platforms where similar 
issues have been reported with mt7915 or mt7615.
I think we should move some parts of this to mt76 (and mt76-connac) core.

- Felix

