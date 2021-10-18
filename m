Return-Path: <SRS0=fNpG=PG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3D59C16A69
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 10:12:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B830B60FD8
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 10:12:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B830B60FD8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=systemli.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZJgcNLX15ewvqSO1ituS5MU0lv5tIcXW+oCdSv98dg4=; b=hTxs+Y3CLv/ie5
	YQHbwjm3qFtD4tWa5kdUakqAI4Bj1o76rxnufzHZIpC5A8ilONBdRlgso36yDrANh/Kt57HM1mkHJ
	HJqhvQeEJw/uhH3RmgCc2a/Gi9QG7fzctqQbvQZ2yoovJgC84fbmhmWwLfP3ILqlgnmq96FA/CduU
	JFrP6x4qpTPYzMblU3osLkdf4C6uaveJItNgZaNtaH50CEsEfNzvdbg+Zv3Pbt4SNJ/dUwl07mfX7
	acwDrwT3v7yWy41uwu6Uf5b/3hLojLsuqbCOI5YlJqrLZTST6E+FEG939fe2+YUzbMVVp/0jPqi+E
	yx5bA4f7PYTj9eMSv3Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcPcx-00EuU5-BM; Mon, 18 Oct 2021 10:12:19 +0000
Received: from mail1.systemli.org ([212.103.72.247])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcPci-00EuCo-Tf; Mon, 18 Oct 2021 10:12:06 +0000
Message-ID: <716d8b51-5a4e-e074-aa1a-4d2055cf18cf@systemli.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=systemli.org;
 s=default; t=1634551917;
 bh=8UJIhyN70fwZRjgdbrYqAOMY3Pk75xYpYaIPzb8qPwY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=4ILAevtORG94wHNj5SUdRup29o7pulKiaN9XdfX0kPxDFwx8wwk2Q0sUrC81o5X8n
 BniEkZmSOHqppsjttcNBQunAHX6ayJcMlXVSUYy3AE2GZhFZg5khfESeE9mDKj0nT2
 eOEC4KyTrXg1DPFBLbEuGMP0Nz8YEAMS2s5LFxgkOvT/OipSgEMyyRs+lPeE+fNd3h
 iQ8I5GIy9rM4GyhF3QH1+UaUqPw2Xzq1pwDowIiOsVJx67bbNJ6+70eNHLbB78HyEu
 GiUWj/VTnwGwV31xZGAOmvcL3wuT1RNUAdC7te1lCBqBbWmGDtBYocf0+M090xEltm
 +id8fSc8R34jg==
Date: Mon, 18 Oct 2021 12:11:54 +0200
MIME-Version: 1.0
Subject: Re: [RFC v2] mt76: mt7615: mt7622: fix ibss and meshpoint
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>,
 Frank Wunderlich <frank-w@public-files.de>
Cc: Kalle Valo <kvalo@codeaurora.org>, nbd@nbd.name,
 lorenzo.bianconi83@gmail.com, ryder.lee@mediatek.com, davem@davemloft.net,
 kuba@kernel.org, matthias.bgg@gmail.com, sean.wang@mediatek.com,
 shayne.chen@mediatek.com, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>
References: <20211007225725.2615-1-vincent@systemli.org>
 <87czoe61kh.fsf@codeaurora.org>
 <274013cd-29e4-9202-423b-bd2b2222d6b8@systemli.org>
 <YWGXiExg1uBIFr2c@makrotopia.org>
 <trinity-b64203a5-8e23-4d1c-afd1-a29afa69f8f6-1634473696601@3c-app-gmx-bs33>
 <YWwqlk6rGbEp1obc@makrotopia.org>
From: Nick <vincent@systemli.org>
In-Reply-To: <YWwqlk6rGbEp1obc@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_031205_290070_4CE1988E 
X-CRM114-Status: UNSURE (   4.03  )
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

On 10/17/21 15:52, Daniel Golle wrote:

> Independently of each other or simultanously?

My tests were done simultanously. The "plus" means to the same time with 
my post. However, simultanously AP and AdHoc was never be possible with 
the patch, nor without the patch.

Bests
Nick


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
