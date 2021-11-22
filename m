Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6305BC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Nov 2021 14:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GAcrQJfd3lkURxSDWiuhiqmrLyyZnTSQT2UGwZTgo4Y=; b=sl3as176X8gxe3
	+h1L230oKXwf6db5wJX/KowCcbqeZmmrBsuQpEqvGfqc51jw6M1/vN2cBbI8sWOypfimFqvfqq9Vd
	rG02PC5ujT94n8i6QKF5ocuxh2E1/2OaSNQEZM0YXg7kQ32MByaxUXxV1AzcNYUebcZPlwlk5iipN
	MMvejAJFMXPZjpQOZWYZq4zoLhOW9lSJM7SNlgazjBZwa9muShsWxsPse1u+k978QrFO+pT0g0lLV
	7icqFvhXcAVIhEpdoa0BnFz/eN52arV602PHWjV7wQVNALlOcRBqgiGiERcBR9ct+UFcT2IlR61LA
	TpWRi0xdteABqWJPHXAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpAOP-00GsPE-Kl; Mon, 22 Nov 2021 14:34:01 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpAOL-00GsM6-7h
 for linux-mediatek@lists.infradead.org; Mon, 22 Nov 2021 14:34:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gS+N4akZ/XZOqsmtrfiHmr57eg/++9zj6ceGNTomSn0=; b=dcUPzf2h59Vc+G90WrB4T0LfVP
 UfJAKSSGadSWZymmTg95Z5MbyQVsGFqiOc7AIXWWhQ3d8KwRTJ3ellR1LJjBVHkLP87fQShN3MXDg
 EqgPA/6pHIan2Cqmlw5RfuPBjyYgPM7AP/8o5k+BDoUeY3IJQQE1sj8CSJJ6K7PYYh1w=;
Received: from p54ae9f3f.dip0.t-ipconnect.de ([84.174.159.63] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1mpAO5-0005vJ-Q3; Mon, 22 Nov 2021 15:33:41 +0100
Message-ID: <262c146e-8c75-be20-54c0-2a20158c1473@nbd.name>
Date: Mon, 22 Nov 2021 15:33:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH] mt76: mt7921: fix timestamp check in tx_status
Content-Language: en-US
To: Deren Wu <Deren.Wu@mediatek.com>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>, 
 YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>,
 Eric-SY Chang <Eric-SY.Chang@mediatek.com>, KM Lin <km.lin@mediatek.com>,
 Robin Chiu <robin.chiu@mediatek.com>, CH Yeh <ch.yeh@mediatek.com>,
 Posh Sun <posh.sun@mediatek.com>, Eric Liang <Eric.Liang@mediatek.com>,
 Stella Chang <Stella.Chang@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
References: <934b51921e22ca6f8983d7cbd9feb5248f804303.1637590567.git.deren.wu@mediatek.com>
From: Felix Fietkau <nbd@nbd.name>
In-Reply-To: <934b51921e22ca6f8983d7cbd9feb5248f804303.1637590567.git.deren.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_063357_545113_6608D9C0 
X-CRM114-Status: UNSURE (   7.31  )
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

On 2021-11-22 15:25, Deren Wu wrote:
> From: Deren Wu <deren.wu@mediatek.com>
> 
> Should keep SKBs only if timeout timestamp is still after jiffies.
> Otherwise, report tx status and drop it direclty.
> 
> Fixes: bd1e3e7b693c ("mt76: introduce packet_id idr")
> Signed-off-by: Deren Wu <deren.wu@mediatek.com>

Please drop the "mt7921: " from the subject, since it affects all 
drivers. Other than that, the patch looks good. Thanks!

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
