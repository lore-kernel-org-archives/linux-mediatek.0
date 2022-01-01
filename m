Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10ACEC433F5
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Jan 2022 13:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5pbhqD7j/+UQbQOAo8dMvS/VHzbzxhxg/kOIRt6QVzk=; b=zmDUURhqVeoOKk
	8V0rUtq0+23DyoGYlehFIo+t98/kkYtXKH5b1iti0YiRsow/78IH3AyKBHH9f3YhKt1eSyosyzLcX
	4Jt4Nty9b10G0PQ+Rt4MfQIyu7oPoIbF929XkILkNU9SjBoSugU6efwwg5Ws8385wlZAF+bJ+UUb9
	RS1YRWOgIlkO1eHBpJarEWbJZKCnCjCPF6Gs5k7/l96/pcUpxS1vaeU+PZnh9d9SbZ0/1SsA4Zslk
	pz8lRpDQLX9DDskU8Q25Sjfyr2tpG3cQ5y3nB4xqIsmu+kPuu/V8RDlyThPcMcONGsoZFfpzAlVpZ
	MjJ/YUo6tNZzliSwZEgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n3e77-0073iM-4o; Sat, 01 Jan 2022 13:08:01 +0000
Received: from smtpng3.i.mail.ru ([94.100.177.149])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n3e5c-0071o0-DR; Sat, 01 Jan 2022 13:06:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=KToB9ioSqLBApRJJGq9ea4pL5GpnS8QdtF/0UlhxTDM=; 
 t=1641042388;x=1641647788; 
 b=N56AxalrRDZGyHrZndr1KtJAX5eUtqXYXqHTSY+UMHM+0lY+YoHQ5Th3JBq7xO7c8e0Ty1h/YlJhngh4QwMwaeuU/VxEwelWYX2ADUa9v4Ae/u8Gtry0xZ5ieja9owQIev7ki+DtX7pqsRgAZ0FVpt8X0HvMyxoKcVSdL+R/cOSrP01/iGi5JH8ckS4VpveIiKdQEH73nsyA1Jx0UJseqfiZudYfL65eIQg23PabQw5ZeS4+9pjI3ql50s0PDZeDxoUqAhO1N0c7dZr5lTMRQTWgc40Xh29IWWuplqqgt5pceAx8g1mbVLE0vryjf/TMw1OaNlcCibzmpH6F4gw3zg==;
Received: by smtpng3.m.smailru.net with esmtpa (envelope-from <gtk3@inbox.ru>)
 id 1n3e5V-0001EB-5f; Sat, 01 Jan 2022 16:06:21 +0300
From: Maxim Kutnij <gtk3@inbox.ru>
To: gtk3@inbox.ru,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux@armlinux.org.uk,
 Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/2] ARM: mediatek: add smp bringup code for MT6582
Date: Sat,  1 Jan 2022 18:05:06 +0500
Message-Id: <20220101130506.13150-1-gtk3@inbox.ru>
X-Mailer: git-send-email 2.33.1
In-Reply-To: dda186e0-38e0-4061-f60e-e297441d9fed@gmail.com
References: <20211230155152.48715-1-gtk3@inbox.ru>
MIME-Version: 1.0
Authentication-Results: smtpng3.m.smailru.net;
 auth=pass smtp.auth=gtk3@inbox.ru
 smtp.mailfrom=gtk3@inbox.ru
X-4EC0790: 10
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD94D5EF110843E6A676E515EAF4FD70AA3725BF6578192D028182A05F538085040E5BD0237C100BAA87D54C989C5EC827EEEE2C162EAC33CE0729DF6D36F72BBC2
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7A3DED2DACB82E709C2099A533E45F2D0395957E7521B51C2CFCAF695D4D8E9FCEA1F7E6F0F101C6778DA827A17800CE731D82F3F177D3BCDEA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38BEBC5CAB6D411FFA61F6588347996ED35101B66044103EC1C20879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C0C26CFBAC0749D213D2E47CDBA5A96583C09775C1D3CA48CFE478A468B35FE767117882F4460429724CE54428C33FAD30A8DF7F3B2552694AC26CFBAC0749D213D2E47CDBA5A9658378DA827A17800CE7ABB305BD10C6E5099FA2833FD35BB23DF004C906525384302BEBFE083D3B9BA71A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F9E2C8583869C8577A91E23F1B6B78B78B5C8C57E37DE458BEDA766A37F9254B7
X-C1DE0DAB: 0D63561A33F958A5A09B03AD8E65B7A56908254F4A8519ED6790FCCE016AA8F5D59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA75B869F6C56E712840410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34524B2D44961BF9C69174E81260E988F08E5CC1D4ECC46F0AF6C887B786391A7732A43A24F8C3F0651D7E09C32AA3244C7E16FDAA18EAFC7B38098160188814501DD47778AE04E04DDCA3B3C10BC03908
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojzdjxcBf1eR6jpxmLTK4rOg==
X-Mailru-Sender: 689FA8AB762F739339CABD9B3CA9A7D6BFC7A9A0EFA9D73F4E93F6E6285CB8038F8182784CE3FA142B2697F7A04D759B04FC54F637BA925032C609A2DC06202998FD9B05CC386A12349DB15C680E247222B820C1B2086D890DA7A0AF5A3A8387
X-Mras: Ok
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220101_050628_902156_AFB31CE3 
X-CRM114-Status: UNSURE (   6.34  )
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


On Fri, 31 Dec 2021 16:51:20 +0100, Matthias Brugger wrote:
>What do we need the clock-frequency for? I wasn't able to figure that 
>out right now.
>
>Other then that patches look good.
>
>Regards,
>Matthias

I thought it might be useful in the future. But if not, then I will remove it in the next patch.

Maxim

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
