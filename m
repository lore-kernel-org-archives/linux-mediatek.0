Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E4CEB64D7
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jun 2023 13:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Cc:From:Subject:References:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OfwgvIzY/UOlJSG791BVcZZbDeg1/YAqLY5prNJq+OI=; b=icjbUBPPMBGvOFTMLAuqFZnB2m
	eBiECcPc91D84YemwpD1ol06SToiFGcNWsr5qWjcqq92UvBU4dukaeNz9cRnKPE8xfSariN3CwzIy
	gozhJVo+eRwNYFZ6mv4bvZUCScdasb5OX4nZQqb9CzbKI0UeUBjaEvR2emP5OV0iOtnia2FsgWw//
	ETK3CydG98m6PZuA988sV/omwpZnX3ocZCaEu1snSCUW4NqqkdGX/oxQKYSwcALsxPDLjJCKgpCSG
	dplRM0l3JOkMqhrV1NBzvt5icfqgGxYqbFlYU6l06NvDLJ1zmUg4bIx38TeJj/Zw97X3T38z85JcK
	4O1DFEug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEV2l-00FkKO-1l;
	Wed, 28 Jun 2023 13:17:11 +0000
Received: from mout.web.de ([212.227.17.12])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEV2g-00FkHA-2U;
	Wed, 28 Jun 2023 13:17:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1687958204; x=1688563004; i=markus.elfring@web.de;
 bh=OfwgvIzY/UOlJSG791BVcZZbDeg1/YAqLY5prNJq+OI=;
 h=X-UI-Sender-Class:Date:To:References:Subject:From:Cc:In-Reply-To;
 b=maSx52S25l3OB2viG96eJqLPplSsSxa7L4F5zy2BdM+CYKR4is5g0e6ZCy8m7MUTKPlB8BZ
 t2yTV0QAkiAYy2rwB6n5oVLWuTyqII+7i5Gmil6A1/GRMsrIqHSpSCZpxNFpPDxpydF57QjAR
 F3jYWMGypxBCWiR8I2zlIaDUZcx/9a9ApCM68enjP5v8uOkutM9sZhkppu25cqYp8rcJ1Gf3W
 X0ZOITUTxx+KvyknhMH3uX5gQWnrdyIphcbIlb1tc1K5zOPCjkknKPgNP5+WMhpguLHeQeWMK
 j6tM1DGzAga+QehBmqLSjB5aCYIZzCdvZ+djGNnaax/Ybz9C1zlQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.83]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MadzU-1pdnN81HHm-00cExD; Wed, 28
 Jun 2023 15:16:44 +0200
Message-ID: <36fcebbe-9d27-1ad0-9903-e4e972677f08@web.de>
Date: Wed, 28 Jun 2023 15:16:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: yqsun1997@gmail.com, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel-janitors@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20230627082731.1769620-1-yqsun1997@gmail.com>
Subject: Re: [PATCH] OOB read and write in mdp_prepare_buffer
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 499671216@qq.com
In-Reply-To: <20230627082731.1769620-1-yqsun1997@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6zJxRtHdhVE15Ujn428t+rub+IenqCR7xk1AGaF5JDaFjvVyZm9
 KkNg3ULi2yJNFGfn8Ef/pzK7FKjlwxrF2x7WGrxraowy/Mp/Fyz/xVxAY8ZfHV9//KkxCVb
 b22fX0NJvo09AIBty9d0Nn+ER8BI8WSrrbVX3XsMGIkCeexljckzw6XwMHTz++EeDIRW7My
 3lNYJPXQrDIeLq4AEXygA==
UI-OutboundReport: notjunk:1;M01:P0:Ubp4s8aud68=;Z3iDAHrJc796qhP6Kw55g0IlzQ7
 rPkeL8hUvWWkI5wj6OSnPNLfZZwp/U2bgGNr6rHrhXIv3UiNOx7iRfadnw7x/I5L7Fdun2LDO
 om1dDsVirr/EMq16bu4KbzAmqygbO+YExqs0nprze7MlswOEHBW2qVaWpSGoN5c7ZpxQATZjB
 GeVdYmLy63WvD7W/hlBLkZaVS/TZwtlf0sLYvUpYGhQ9aVre24V8X5ukQH9NFYHLYEvAYgBC6
 DQRLQuH6sg0przY07M6CoXGGQjdR0MpVQZGeVZuKAcY6ZKs0qRDeWi4tFGtNa78r9uibQ9X1i
 JYcL4JXLSYTP6o9ApZJEnhapmd1wRUK7WsQtB1Sr11gA3e6BvJZry4G8p06eSrqM1vFnE21XF
 WfzI3TtTjEihq0nS2iT5xlj0LN1JDxY2QtnWyD3NUzz9Y3o4ugJwRK9ULXEhzPP1c1c1flUoA
 wGUnjGE20xVRVSl3zbCvVRY+uzYKyJJ1sGtWingTWGrHoXv2G0FiLeYsl182Wkko0NM87F+xl
 SM/EwNPVpBrPPIKlLZt1t6vrgWTFa4KZWjK/nB84gP8sWXaxgQiZGvig/7WO23vZe6TGGigUb
 Ms2ZaI6rcuQuG+5pRYODhAxC8uTTxJt8cbNJYploWEszkJ/RUMPWHvFxpRZrXJdcrxqxQX9bj
 PFLiEARarXu65l2G7tR98ODjhaYhQk3aDuA8ILNrM8zWQyy+QQHEHdzV+hG3lHJGZiAYaswvF
 7dGUEzV9pLBfpthRNdLy3Azed7hPg5tTaFRWJEt65SSBYoCuuej9EffvSVClhAFnvWFJnPSwt
 7/wjJz6xXS28Mrr8w0wULXlW+/dh1ay+zfzu2bSS4dcrI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_061707_270782_C1BE3E82 
X-CRM114-Status: UNSURE (   6.63  )
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

Please add a prefix to the subject.


=E2=80=A6
> The num_planes max index is 8.so will be OOB like in mdp_prepare_buffer.
=E2=80=A6

Please choose an imperative change suggestion.

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.4#n94


> Signed-off-by: yqsun1997 <yqsun1997@gmail.com>

I imagine that an other real name would be more appropriate here.

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.4#n411

Regards,
Markus

