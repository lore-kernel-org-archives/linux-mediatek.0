Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC4ADC3DA5D
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jul 2024 15:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Cc:To:From:Date:References:In-Reply-To:Message-Id:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s+PzQcEGeZO72mJxLzVW32ROjmZ1iVcPKvrWAwSV2OQ=; b=MtXNKVGFiuOOLGHNsuLEb4/803
	WCoK8TA252qIbVc+QNnkG84hiSudUkp2f7Hu32vRlFsZ/eUycJ7G8f1mv9Z6ymYpD3Pfl+Vrg3Jkl
	Xm5d6ryQM40z/qlu5GYSg+mpZPmJOtq7Wxoksa0mGkEf6hAfVfGDFNzmDD29+dY3M5xS6lW+fZn6d
	DuacK8tHOQIe6iBWXkrmXLYAebjhEuSG+ELRjt1L4hGaUyNzwbZ1i9yLzO16DeChELI7iqThfnr+F
	rWErvveujFqZHKfXTRikDfDsG45CBeZlCuHXfmrvdVZMyueTgBVRDm739fd8rIVjilbtA1+sME/xo
	i/934Oew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUpQu-000000034SQ-0svp;
	Fri, 19 Jul 2024 15:22:08 +0000
Received: from fhigh2-smtp.messagingengine.com ([103.168.172.153])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUpQW-000000034Nc-3dvX;
	Fri, 19 Jul 2024 15:21:46 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 38C13114021C;
	Fri, 19 Jul 2024 11:21:43 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 19 Jul 2024 11:21:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1721402503;
	 x=1721488903; bh=s+PzQcEGeZO72mJxLzVW32ROjmZ1iVcPKvrWAwSV2OQ=; b=
	mi/qsxgnCXB+X5PlvJW2HoxMK6iujYQNBbYtxNFzebj/cyUrmAGm6Q9+l9nx/5SE
	oo0jY3ypsJtMGVPZEpVpN31rmTd4nR04EWzNg8rFXIjC4YVmw/1/wXzDOzvgLBkg
	UdBLQG7cZt7EgpWX/OYbbcU65XJn2E9GZ5nDoFcE9+ddjzn/3i9OhRIS9fKftDjA
	FxJBVKaOlJZpYunUDejQo9+TcNi6ueXrRHYnK+7ck5f0by8DifPhifMBHltA7nYu
	jPNvYlooPZWqoQh+yCtwv5A2EgIF+z+l1JmDlIiL0fQMfZkT7Gbkmfd31ux4N+KL
	wefESr56pISi1mGpOyv0Ww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1721402503; x=
	1721488903; bh=s+PzQcEGeZO72mJxLzVW32ROjmZ1iVcPKvrWAwSV2OQ=; b=Y
	XGrk/7aTnFZ+EZuy5agZQcH6DWudmBU1IvyPvmYWbzl22ETonHux1PYpqmQzPOkK
	ThD7JTRvy4XXUBgExLj2qhOftENXm82nW23qJKQjtf9W8QhWbpus+wpadANkFeVH
	cYrVqkgpXMzd8NDF8KZkaoojvdmFCuPTya4SVvY6TXNEta+iGQ5hXX1iUdik6gY/
	qB/S4UsrAJo5csZ3I2ijB3kz10zJ8JnrtBABsdVH79YBMnPfUu9iYSvAECfj4cL9
	blqIOwbYSpsqucUgOQrubdSfQ6qr2IMukjFaE1dK1rQ8l+CYgYdEHJclTGInLIsm
	SGzPstvT0tBMBU/xZgeUw==
X-ME-Sender: <xms:hoSaZmyhWqc-Ik-4xAvo11PPfGYmQr4prnvdDltyYlso31zSttRQwg>
    <xme:hoSaZiTfI27ws5hDnT9-VJONajKJ11qjZHqQlwzwPs0UPXh183uev7W6Q7QFr2_H3
    4MThR4ehiO_dMzvCWo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrhedugdekkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepgfekueelgeeigefhudduledtkeefffejueelheelfedutedttdfgveeufeef
    ieegnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:hoSaZoWyUAQAt7AwZD7hEr-HGwUz_6RhrsmPFS_LPWTZAHPTOc-INA>
    <xmx:hoSaZsjsPoTE7qHxdTIznvIDOH8vAATrRcf8a6gcNlWy4xummeRe4Q>
    <xmx:hoSaZoBFKsyFd3eqjw9JAj8CoT-QjkpFJDVgoERkc_fkAxb787bHoA>
    <xmx:hoSaZtIzV3unhl-YENBJtjdDOu-0-aReAdWLxPvs3afoWE6u09nh4A>
    <xmx:h4SaZgbK0E-cfIssxqqBF5O9Y5ZFVoL-omwzUK_avZ-b-GRPWFJl5WKk>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 0CE24B6008D; Fri, 19 Jul 2024 11:21:41 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
MIME-Version: 1.0
Message-Id: <9facdbd7-66e5-4756-85c4-ededc55942e2@app.fastmail.com>
In-Reply-To: <CABBYNZKFD7axR5ZSGJL7mn=_mKufGnxopUeeZhL+AL40jWQjzQ@mail.gmail.com>
References: <20240719100554.4183635-1-arnd@kernel.org>
 <CABBYNZKFD7axR5ZSGJL7mn=_mKufGnxopUeeZhL+AL40jWQjzQ@mail.gmail.com>
Date: Fri, 19 Jul 2024 17:21:21 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Luiz Augusto von Dentz" <luiz.dentz@gmail.com>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Marcel Holtmann" <marcel@holtmann.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Sean Wang" <sean.wang@mediatek.com>, "Sven Peter" <sven@svenpeter.dev>,
 "Tedd Ho-Jeong An" <tedd.an@intel.com>, "Hector Martin" <marcan@marcan.st>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Niklas Schnelle" <schnelle@linux.ibm.com>, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] Bluetooth: btmtk: add USB dependencies
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_082144_996937_B67E2AC6 
X-CRM114-Status: UNSURE (   8.91  )
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

On Fri, Jul 19, 2024, at 17:08, Luiz Augusto von Dentz wrote:
> On Fri, Jul 19, 2024 at 6:06=E2=80=AFAM Arnd Bergmann <arnd@kernel.org=
> wrote:
>
> Thanks for the fix, but we went with a different one:
> https://patchwork.kernel.org/project/bluetooth/patch/20240719033019.26=
767-1-chris.lu@mediatek.com/

I thought about doing that at first, but I believe this is still
broken for a configuration with CONFIG_USB=3Dm, CONFIG_BT_HCIBTUSB=3Dm,
CONFIG_MMC=3Dy, CONFIG_BT_MTKSDIO=3Dy. I haven't tried this, but I
think this should result in a CONFIG_BT_MTK=3Dy with the common
module being built-in but unable to link against the USB module.

      Arnd

