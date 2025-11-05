Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D21CCFA05
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Nov 2025 11:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ebs8q+Zhkz66rPrltv/PRIcVR13h8mXvCH9YO5ah/jM=; b=3HYBTCEJ67GSpa03MVdkOFBA3S
	dUJW+XIK5jKdWANhCbyPmnw+xWs/F9oLkFSLhyF3Ia94k51/BU844l7cPwxfu+hEyhKd4IaNZOy6V
	RG+t8uynKZj6J4KyabIp/P4VsUIb5wy8a1h5kClnE9Sj6gDpBu905AqXcEaBBXd3HVONaWAqcK9+k
	EL0nsZyHEOxrolv2yi1ZKL8/aBxO66I2BHg9H6aoH/crC/MiwdZeN9ClrB4WXRRcyK+BhheJaYcAI
	1GGfZ5WJWoq3ffaNQQGTrhD3VqNf7UF09WNLzS5QTzd2mdxPgo/9N6b868/Bn4JjMFUK1n5e2hZDu
	ST5UYZ6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGc35-0000000DZ4R-05tQ;
	Wed, 05 Nov 2025 11:51:35 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGc31-0000000DZ3t-2zzv
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Nov 2025 11:51:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Ebs8
	q+Zhkz66rPrltv/PRIcVR13h8mXvCH9YO5ah/jM=; b=iXJ+NqGo3cRySRjlrr7E
	DTSdpXkQtzffhxQZ6Q+44owc2Vtwm9M1aOC9GGuyTaQoGh78/pXmk4E02KvyStGq
	wWxEtoVUy1WnG4DdBg1Dewk7SaAIKNBCG/Uy0732KZL0+qJFl4IDIx1A6/chXGDM
	sx/S/3Hj60Udx7b1Q1Q9UBoImVljYbWtrffEK2du98YlJQomtG9/1Ggid6AwgYvf
	TIYavlaRv8KImrPNenMA309ewpCYf4JTy60P2MRrPZIKXWOTGfn2sE2g2fJqeay/
	xmYxwqGhUD+rERgsTh7x6Qa4q84mQEtAQNGrbJw6WyI+am/bbvDGQslxtQFjROCM
	iA==
Received: (qmail 3053310 invoked from network); 5 Nov 2025 12:51:24 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Nov 2025 12:51:24 +0100
X-UD-Smtp-Session: l3s3148p1@9OVSkddCDtEujntX
Date: Wed, 5 Nov 2025 12:51:23 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Frank Wunderlich (linux)" <linux@fw-web.de>
Cc: angelogioacchino.delregno@collabora.com, matthias.bgg@kernel.org,
	Andi Shyti <andi.shyti@kernel.org>,
	Qii Wang <qii.wang@mediatek.com>,
	Wojciech Siudy <wojciech.siudy@nokia.com>,
	linux-mediatek@lists.infradead.org, linux-i2c@vger.kernel.org,
	daniel@makrotopia.org
Subject: Re: i2c issues in 6.18 on R4, but not r4pro (both mt7988 with
 i2c-mux on i2c2)
Message-ID: <aQs6O75BqOERMzPJ@ninjato>
References: <3f5ef2d1336933a87d9761b5ff510a1f@fw-web.de>
 <64fb54d5f2bc929720d3313f7fa2d8cd@fw-web.de>
 <aQdSVcazPQl-shR6@shikoro>
 <1144f62ad9886fed60620bce0bbed7ee@fw-web.de>
 <aQfgEuelvU-8_2rh@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQfgEuelvU-8_2rh@shikoro>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_035132_626936_A6435EBD 
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


> > Maybe this option should be enabled by default or when the i2c-mux is
> > selected?
> 
> That's what we were discussing. At least a warning will now get printed
> to the logs when booting suggesting the above solution.

FYI, all the commits leading to this breakage are reverted now. Sorry
for your troubles!


