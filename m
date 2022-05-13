Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8DA3C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 May 2022 14:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=13pd3W0UKGdEVXh9ttv/m/qzTxASV3lFGUMyjrV6e4Q=; b=mO79H8JlBTb+qa
	ryLsfkGPJhwI1Wj/2ZEXnWrNpBrCzxOG/YRDR7h2UmFha5G1a3ZfPtMTburiQZm1s3ByyOSQD2t8v
	1ftYt2GY3uaR5UistCqc77SCaIst0Kc6K0+qM73YeuqA++G0owA0Eqt3Be7zCVDTw8zJcn0o6H5EJ
	9rbwyG4KQsUKUMwQM8EDUqVlKb/72T03wlFeYvOaoJxdWhA7E+bvv71GeHcOfakxO6Ey3/RV0fDeJ
	S8qt1kvynZ18QBMLYYDuS8aXSP5E96jvLtk2lqxSENnenIPrPolELgh4iqcprX5Y2VciWm7B5Q8zW
	CHmHwkibA8oHxlS4Q+/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npWUL-00GTqc-3k; Fri, 13 May 2022 14:41:53 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npWUI-00GTpw-NX
 for linux-mediatek@lists.infradead.org; Fri, 13 May 2022 14:41:52 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 17DB41F461AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652452908;
 bh=6Dco2Ss56mOS9SRrFtH4AnkhAjVH1fenM6f9Oc0sjC4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=PHwvr64OiJ3wiXjognKoyniZXsfJS2BHOEgLZL81mpS7mTGLmwGwDDrcKBgg8GbG/
 4qJ+ORQM1R9yn8rG+1Yiubm8Hks8W4EMZcg5PZpL+Us36bUd34Z5cVIfo+f25kLiht
 7x08AlU5aT2SaTQwfUw4YtKN3TJJ3+eo7JX305Qf2Tu43TN2mkkQ4X4rRAhvcvdgQq
 Pk7LKnf4O1OEa5wXnnY2zULxJlj21g5J6NJI9fl5oOcM1W14GdtTh8jnlSX0EK27b1
 QMDw9uNxEV410GPnN0/JRFK0wx0JvD5rM4kg8izQ++IMGCgzIMwxnPSP3JhxYVSUgN
 Ec2ir55GmrrcQ==
Message-ID: <41cbfd34-e3e6-e041-2cb6-bbf28782a299@collabora.com>
Date: Fri, 13 May 2022 16:41:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 1/2] Bluetooth: btmtksdio: fix the reset takes too long
Content-Language: en-US
To: sean.wang@mediatek.com, marcel@holtmann.org, johan.hedberg@gmail.com
Cc: Soul.Huang@mediatek.com, YN.Chen@mediatek.com, Leon.Yen@mediatek.com,
 Eric-SY.Chang@mediatek.com, Deren.Wu@mediatek.com, km.lin@mediatek.com,
 robin.chiu@mediatek.com, Eddie.Chen@mediatek.com, ch.yeh@mediatek.com,
 posh.sun@mediatek.com, ted.huang@mediatek.com, Eric.Liang@mediatek.com,
 Stella.Chang@mediatek.com, Tom.Chou@mediatek.com, steve.lee@mediatek.com,
 jsiuda@google.com, frankgor@google.com, abhishekpandit@google.com,
 michaelfsun@google.com, mcchou@chromium.org, shawnku@google.com,
 linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Yake Yang <yake.yang@mediatek.com>
References: <e26167a3fcefdeae1151162e8676c9a467a8100d.1652390894.git.objelf@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <e26167a3fcefdeae1151162e8676c9a467a8100d.1652390894.git.objelf@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_074150_956821_27E6372A 
X-CRM114-Status: UNSURE (   7.32  )
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

Il 12/05/22 23:38, sean.wang@mediatek.com ha scritto:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> Sending WMT command during the reset in progress is invalid and would get
> no response from firmware until the reset is complete, so we ignore the WMT
> command here to resolve the issue which causes the whole reset process
> taking too long.
> 
> Fixes: 8fafe702253d ("Bluetooth: mt7921s: support bluetooth reset mechanism")
> Co-developed-by: Yake Yang <yake.yang@mediatek.com>
> Signed-off-by: Yake Yang <yake.yang@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>

It may be too late but, in any case, for the entire series:

Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
