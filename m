Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C8DC48BC3
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Feb 2024 19:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Date:Cc:To:From:Subject:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y2RZ23m9enNKotmbzmfdjyTwnNwA6e7DAWHJvHIfF94=; b=kb4QK046lN3PEvivzoo1bdRvA8
	OfgOf7104osnAFaFdRfp1eCVGb008h6VlWUTHce5exgNv0SZf+3BloU2RFKK8IYR1eUom/LgvzcRR
	dlEIdSJcqYQ4P28v2at4MhijaBeYySgZmNSbaCga2oZIu6sOWofNjXD1mUQldS7UH+bjmN+q+bzMV
	5nfqori1TggNjh/qsWNogqVIr6hDWQrQmpelwknelqlPGI1uPxrOxzgFACtUUiuSbCyOb89QoErOV
	9LN52kwfCckV8EnjR4Husi8qGpMP905LNc/SJiCO7oAdUQgVd2n5D4KZZyqAHAR6e26cnUOofFyyW
	YfuCyuTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbQcc-00000006GMg-35oU;
	Sat, 17 Feb 2024 19:45:14 +0000
Received: from smtprelay0011.hostedemail.com ([216.40.44.11] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbQcZ-00000006GKp-31rV;
	Sat, 17 Feb 2024 19:45:13 +0000
Received: from omf19.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay01.hostedemail.com (Postfix) with ESMTP id C5D281C0269;
	Sat, 17 Feb 2024 19:44:59 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf19.hostedemail.com (Postfix) with ESMTPA id 0EEA320025;
	Sat, 17 Feb 2024 19:44:56 +0000 (UTC)
Message-ID: <102e5c65e07ebdade5400ca711fba131a37027a8.camel@perches.com>
Subject: mediatek: media: Missing alloc null test
From: Joe Perches <joe@perches.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
	 <andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	 <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek <linux-mediatek@lists.infradead.org>
Date: Sat, 17 Feb 2024 11:44:56 -0800
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Rspamd-Queue-Id: 0EEA320025
X-Rspamd-Server: rspamout08
X-Stat-Signature: jtj5gxkjrn6psxqbp7ktoek7c5w55gzq
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/mi3Mj5scL1ByOsIwBfWZOxpOvRRYeA7Y=
X-HE-Tag: 1708199096-891621
X-HE-Meta: U2FsdGVkX193Saf57q9yIF6MDuyE5/FDuYOW0Jg6+JkwL2LwrgbYynYObJBWcqCClxlv4MeR25Rb48n5OI1kDPWQaZCTPjJiFzlCnThe+luGs/P1grkpEswA4zNaoAOWJxt6LVHEq7FF5DaqtJLR0sBuNMMuwYV8MGShqen58zm0lAaMXpzxFzD6FKbX3KYS+ux3tYQQhalVyv3kB3KbJ8nJknEFY08TAGSN/kxcfcmejaBHtHI5ngt+k8fiLwu8iRg67fftVlJHRv53JNdp9oAWcLtn5U/CnNtuWtijsWOJPl/z7AUNDgM4zaNPSQQ+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240217_114511_821604_8AB75309 
X-CRM114-Status: UNSURE (   4.79  )
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

There's a missing NULL alloc test here:

It doesn't appear obvious what a proper fix is.

diff -u -p ./drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_sc=
p.c /tmp/nothing/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_f=
w_scp.c
--- ./drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
+++ /tmp/nothing/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_f=
w_scp.c
@@ -79,7 +79,6 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_scp_
 	}
=20
 	fw =3D devm_kzalloc(&plat_dev->dev, sizeof(*fw), GFP_KERNEL);
-	fw->type =3D SCP;
 	fw->ops =3D &mtk_vcodec_rproc_msg;
 	fw->scp =3D scp;


