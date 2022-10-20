Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5191DC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 05:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WmQuwKBWTimCndR3nC++in8cypH3ZEm+MiDheyuj4O8=; b=cDWInO+xUp7gpu
	SBOdcKZWrPxx/W8Yq/68qD0bFpQ3Ik6QEbPAepZiDl5DXN41rQlznwzkN7zb4vd1MKqa3YUljDFGU
	eOVO8GKfYvT5o80K0soy37qHHJ7P3+WJ3whWHQNxWnZWqOJ2st9zST+9CPCKNanmajWL7wkB+/2cm
	txH52e4ku9XQisMYNWwqRBGUkusb+vmeT5Zz6rKdpVDHjHiUHrgEdFHoXzzthcob0NYUg+CxXq3zM
	dg/azk4Y5utq9oAFUkpyjNef9EqtutS7frW5ZVo5iJ12PbFhg/FKM6AQxE67/vGlhqZyrBmYHOGnx
	8QXie3O0JAVE5KSM/tPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olOWg-00Aq5I-8N; Thu, 20 Oct 2022 05:55:30 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olOWc-00ApsA-2W; Thu, 20 Oct 2022 05:55:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1666245299;
	bh=eYfIfwKZVAPHWPdUZhZS++LaFuPSNaUX5JkNXjlgyig=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:Reply-to:In-Reply-To:
	 References;
	b=GNaxmdC3RMACnIFIqOSr/dnCILu/l3sJaLLfRaN96waBuLoYrvyD3+jxnH/aOQsYv
	 EKIGV/imtM7zerR4fK+LTzeXOIWj/P3AMUrxLl4TkGsixmJnerPzWG38Q5bcjfQX8I
	 8a88jG9z9Rlu012ZTRu36YxGaTtE+MuM1sqga8sQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [127.0.0.1] ([217.61.146.75]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MUowV-1oclgR3QXJ-00Qm59; Thu, 20
 Oct 2022 07:54:58 +0200
Date: Thu, 20 Oct 2022 07:54:49 +0200
From: Frank Wunderlich <frank-w@public-files.de>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Frank Wunderlich <linux@fw-web.de>
CC: linux-mediatek@lists.infradead.org, Alexander Couzens <lynxis@fe80.eu>,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: mtk_sgmii: implement mtk_pcs_ops
User-Agent: K-9 Mail for Android
In-Reply-To: <Y07Wpd1A1xxLhIVc@shell.armlinux.org.uk>
References: <20221018153506.60944-1-linux@fw-web.de> <Y07Wpd1A1xxLhIVc@shell.armlinux.org.uk>
Message-ID: <949F5EE5-B22D-40E2-9783-0F75ACFE2C1F@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:soS9ZlfzVGHMnYNJViC28AeLChMiaM1aVARhkc8HuzudRHY7DPZ
 EKNlvaxU2vEqCTOvtcyYn8vBZVkN843XxDk+coA0TWxjhhZ796HxvyVRoDWefNVzxzh9G2u
 8yxmLx3eNnREm9NTb0ADlutsSMwcLdMOeOu0pQfqHuczoTNHbvuQmsGyufZK7hszK2nk3lK
 FsqEhBo632zluJ3l3S1RQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:97lpaLYe6Os=:zunmQz9114/K9zjoMonKLW
 eEiEXvyiCuzaOWivMJRFI7eV1jQRy+rUTOKbmo38h3rT+DleJcq80NMBWxJPv2Kt3BiA4Qjoa
 5PvcqPAuNRIx6/Yxvc+Vuctpx+q9BGy+pMO+8nZEpi3otGe1vMXMfVub41mwRCqvCUc1i/M8e
 6kBAbVjIuQj/qTuQNDP5xHnK2yqUmOF3YKYQczZY7dAxHsLvrxUs17tuTKsHMhD4WAg575kab
 k+mdm93siPkUZlvwOu+sZBEo5FiI3e0wgmRRgvDvLyzqwbicKVnO6zwpkjtZedfWvZW3CKSNG
 EyuBdwZnTxfQV2qxW+rtwbzWiRP3AQDGMEo3yfbQ17GmZ+zB5CZjBfswMvJF0HuPv2JaVCgRp
 XgOwL6A4tHdv4glA2Zy8VJ2PdJbylpForeTHQzvWsvAO/aLR/SW3dBHtKs/huzFgoyY1BcVod
 yPQPTJ5cn2/odb4MSlvEoQ5cm5k7LrGO8DnmMQvX08BQeNqYd2zT1d9j4rlN5Ux6uzfzv1tGV
 x/gRdQKQ/dVFySsQzARxbPi81AM5XmwIvdT3kd2OghtL5UJtGXRm0DP6HPOlhSdl9geDtgmXd
 k/5EXxgYq9SzfOCZi0+2cw5v8ZZ7nxWGsruS0+GCG8HePEMPicFZ32wc82XYPYuXCJMqgCNuq
 xhmBrXMa41e01wyXwfP9UWYZCw3W5ln1gGL9NoXR40zgcbLJd6+AKdm3gVSMGAkdHS9p0TNiC
 0PQoZRPnwEmaA7cQaoRWEhrdhxwrETunl2ll3dKg/+Alrg+DQ6RXLp4Su68t2ErDpbIan1vFz
 sEhE+V2tTqpt6wo4cX+yF9mmzDycPIjkYAQ6HdEoZDP7yUkGGDZqMvsm5nuOj7t45cRvYe9Tl
 jdzrljx+66fazd49B4wPSgLO8CgScy8TxjuyZuUGhXEdd7duPD3IxNCZi//LfWKqcYrLfpRcJ
 zNa3hx2TElbaM5/3U+IDA8wVepOgXmBTVyhaR+tbOg7AQ1ZnFHQFhakUA56wIDFcZz/ZB2xtf
 WGmdgDRv96cwkOfiMO/vZs8Eyt24jKcu9PDwOBU/M7k+kvPZaP3Q8f1YEnF2eQkUvMVaOzsNf
 S6135R8WhkjsCnqdTM/ImNpC8aSjA+em98hA7ljXuk2J2A1/F/dhHiSlZa4lkEckbeFeraGDZ
 3GSAoLUYFItFc36NxXgNMm1Z4OjwK9090KLH3m91bZbhi0KIYT71BBRmNNJ2SRg8Na4x8nyju
 osvd6tYvj8Zk/VHO9hdtW5IlXPmbevI6sgYtCuo4n1jFOuwQq8bTx93Bcxo/429TkXq/OUWhN
 uJDw6vV8wyT2S2MY4Wm+NxNjnajJCJ7PMOFX/v6MQBO2A2dBR9yekvAu7AUwR1xUD7ttPQknj
 eCsuvIec9A4D9du4hwlQcVe97SSVw0UEjIpUSbt35uO1mHXon7LpTvHMYCKelQ4+GxMUbWjaH
 C5Nymt8vodxeAobYi6BuhcVMOIwIhCnCoob0u867OQPmJ/cklNySti7m9WG1jGMfaaNa3Sgfg
 9waD8JDGO8K9qVj5g3brshTfhQ51/LziWJnXAELokMwe1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_225526_595054_9DF6F684 
X-CRM114-Status: GOOD (  13.01  )
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
Reply-To: frank-w@public-files.de
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Am 18=2E Oktober 2022 18:39:01 MESZ schrieb "Russell King (Oracle)" <linux@=
armlinux=2Eorg=2Euk>:
>Hi,
>
>A couple of points:
>
>On Tue, Oct 18, 2022 at 05:35:06PM +0200, Frank Wunderlich wrote:

>> +	regmap_read(mpcs->regmap, SGMSYS_PCS_CONTROL_1, &val);
>> +	state->an_complete =3D !!(val & SGMII_AN_COMPLETE);
>> +	state->link =3D !!(val & SGMII_LINK_STATYS);
>> +	state->pause =3D 0;
>
>Finally, something approaching a reasonable implementation for this!
>Two points however:
>1) There's no need to set state->pause if there is no way to get that
>   state=2E
>2) There should also be a setting for state->pause=2E

Currently it looks like pause cannot be controlled in sgmii-mode so we dis=
abled it here to not leave it undefined=2E Should i drop assignment here?

>> +}
>> +
>>  static const struct phylink_pcs_ops mtk_pcs_ops =3D {
>>  	=2Epcs_config =3D mtk_pcs_config,
>>  	=2Epcs_an_restart =3D mtk_pcs_restart_an,
>>  	=2Epcs_link_up =3D mtk_pcs_link_up,
>> +	=2Epcs_get_state =3D mtk_pcs_get_state,
>
>Please keep this in order - pcs_get_state should be just before
>pcs_config=2E

Ok,will change order

regards Frank

