Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13137606A325
	for <linux-mediatek@archiver.kernel.org>; Sun, 25 Oct 2026 08:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H1tj+E5F;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NNkk+l4E
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=L5HnUNLFXRQf/6dxLPFNXYLFL4knAlxUvl8n9LuSkpg=; b=H1tj+E5FOCcqgq
	EQQfme3PYpOQ10Y9J6dM00lR3dzHlZNQnaL+iatiW/oUXgJiBhwwDhr9Rm1iIcq7yNG0m9vKZqAaK
	C8WhxQv6hIWDUNEYRRRcvC3kpu5+dt9NBDytvxpd0PrYVeon9VPBKaDCYtb/qBHBiZW+s0QFVOeC9
	Y9hqDH/ZPcN9R7oSMMenutTh/A03BzdjiQGTSE0irsulPV6QbRJDFHXNrxHoSqZRYXP1kZVVVl10O
	LzdiIO8ZJOKXBEzSjPj48+RQat7m5lFcHt1Nequ+5hdX4Y6OtM7PLKgshLJcBCB7BfxNJjhxPHJ5C
	3fY7njE+ZjsSLomXu7ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKtsL-00000000tfQ-35Vt;
	Sun, 25 Oct 2026 08:46:45 +0000
Received: from mail-dy2-x0b.google.com ([2607:f8b0:4864:36::b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKtsI-00000000teR-3zxT
	for linux-mediatek@lists.infradead.org;
	Sun, 25 Oct 2026 08:46:44 +0000
Received: by mail-dy2-x0b.google.com with SMTP id 5a478bee46e88-36888ae05e7so781093eec.0
        for <linux-mediatek@lists.infradead.org>; Sun, 25 Oct 2026 01:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792918002; x=1793522802; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=L5HnUNLFXRQf/6dxLPFNXYLFL4knAlxUvl8n9LuSkpg=;
        b=NNkk+l4EHBrHfEl6CSnSSuk4dSjWS12QOG3ngqRzYy+TU6NZUwvdZ3qxWBYzQHmQS9
         rJ+qzHtYWPf0/VQuP22qsEItsvz9r8ZQ/v8YvC4jkR5VkVlwxZ+MBJuvnZ1HvXxJyMfm
         ykKOExbKjPsSKNclcTlnX/2hnmCbNoArKPd/9tNxx7L5Ith5BsgeSF7sg2ntw7656d5G
         KcaqYE1Xd0syIQ9hnsoYjuO4qXlrNZXEqWqJUN6Dn2nWzYCfqq0zokhYT73XtQw4bDO6
         LwgbTTq4xThg6//tz9Eex+aEJeFMFTSg1DkrN86MAQXp+E8Cmj0LPJyynfsy9k3uKyGR
         EqBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792918002; x=1793522802;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L5HnUNLFXRQf/6dxLPFNXYLFL4knAlxUvl8n9LuSkpg=;
        b=bXiAlj35DLq3a2ToNPiXmnI8JASzwyIRztw0PI2trjupm+66wq08bXLarsWtR5f0aV
         zGma4ypbS3OPyLQQpNv0memcmnB+mMfKsi5hgcqSJQ4wQAuRgBgw/WZKckKX7LORIqzD
         18X9wFWLdeINlxl6GKkC96yYBCcz6TwxjtDdWHo4i1CjuNt9kJTA/MuXTxsJUo3liKmA
         FKIFFryEsMlo+yEFKJkRtlVXuhF0e9YBDr+mhj3UtidQgMZ5iLLMNdfp83k+vY2yrWHk
         d2uD8LwpbEhB5+5DQRlXR+r2YHwcUkdQYzkZIf7yCsij47E1EvQ6qX/1FTMgIWHwrzio
         iE0Q==
X-Forwarded-Encrypted: i=1; AKwUvBxV7bD6oqtwqJMEecfrc6iEtAgV3dbK+xjrUMJtZooXJ6eJJ5mED8971Tm0Gemjj3K04JOkI0tmu4wXORn3/w==@lists.infradead.org
X-Gm-Message-State: AFq9FYJpzcc7hB4vdQRj/TT69Qhip1fFLVUuCo+XcqPfzjzAAwqwhOFl
	m+DFz3Biau6o3/aVmlOUj5YMNMHrQxVeQmD92dCa2K7GI5ZVaeq3Qcfz
X-Gm-Gg: AYBFou06iAsU5/BQ6pQCe9C+29kDYJw3SlC5D89YeqKdzNr5jMMx07y09fUtnzhTA9D
	ePrORdXvqdbvkc4KDpaVm8CRL9wgPXDS2Z+NmujNnrcXEd0JWteMBzBwb2Yq9LhLN+g7DhHVDTB
	jBlACNuVnE1kds3TrA7Q9a0M14r5yF2XAr4vxSASPARakOdxa5O1GzTR2PKpt19T+LaRqKqCGPF
	FhA3jfylB+TbUGwey+Q5MGkwPdmghRYADckaX2UaZdktzOMwQBgeGUkQ6/FRJgb1i+Js+U3t5ug
	IV+lB4jQQfipHPvrT4WMrxZqh65gVn06WrZt3glXApwqWkYXF8dlK9DTKtn2MfN/0a53USNTpU+
	fZni1qf3GT4rH7cjGcZaD1B4uA6VYireAnqw8qp8i2Zqtcpzn62tlI5JokZGbIXuFF7kizVtXDv
	JX59/sJBZ/ZVwcPOFBksFoKYLSmcKiLrIuy9ax30rgPnqA6yV8leaBXGoPzgA2U1tfBzQYjaUzW
	aGP6CaZwLjbfjTlaH+iyNvzeBkcb+Hkr+37so1NEHM87Pyz3aj6GP/1xD9JMjHURQ==
X-Received: by 2002:a05:7300:8aa3:b0:369:b82b:5fb0 with SMTP id 5a478bee46e88-369e84ac218mr5762198eec.23.1792918001511;
        Sun, 25 Oct 2026 01:46:41 -0700 (PDT)
Received: from ehlo.thunderbird.net ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm24418092eec.25.2026.10.25.01.46.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 01:46:40 -0700 (PDT)
Date: Sun, 25 Oct 2026 16:06:39 +0800
From: Coia Prant <coiaprant@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
CC: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Roger Lu <roger.lu@mediatek.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_soc=3A_mediatek=3A_SVS=3A_fix_devic?=
 =?US-ASCII?Q?e_reference_leak_in_svs=5Fadd=5Fdevice=5Flink=28=29?=
User-Agent: K-9 Mail for Android
In-Reply-To: <fa60e7c4-d8ca-4ff4-a56f-6a6e2bfbf3cf@web.de>
References: <20261023082948.1854252-1-coiaprant@gmail.com> <fa60e7c4-d8ca-4ff4-a56f-6a6e2bfbf3cf@web.de>
Message-ID: <9AE974CC-F342-42F0-84A3-D72C3A0326C2@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_014642_989928_792AD455 
X-CRM114-Status: GOOD (  10.05  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On October 25, 2026 3:58:06 PM GMT+08:00, Markus Elfring <Markus=2EElfring@=
web=2Ede> wrote:
>=E2=80=A6
>> Drop the reference before returning on both paths=2E
>=E2=80=A6
>
>How do you think about to increase the application of scope-based resourc=
e management?
>https://elixir=2Ebootlin=2Ecom/linux/v7=2E3/source/include/linux/device=
=2Eh#L1363
>
>Regards,
>Markus

Hi Markus,

Thanks for the suggestion=2E To be upfront: I'm not the maintainer of this
driver, I just ran into the leak while reading through the code and
wanted to send a minimal fix=2E

__free(), DEFINE_FREE() and return_ptr() only appeared in v6=2E5, while
this driver dates back to v5=2E19 and the fix is tagged for stable (first
LTS is v6=2E1)=2E Converting to scope-based cleanup here would not compile
on 6=2E1=2Ey and would force the stable team to rewrite the backport=2E

So I'd prefer to keep the explicit put_device() in this patch and leave
the __free(put_device) conversion to whoever owns the driver, as a
separate cleanup when the stable backport is no longer a concern=2E

Regards,
Coia

