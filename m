Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A839C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 17:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NX5bJbWmxaQshUfCrgpY5103p78+HOi1IFzMA3iI19I=; b=4NXQxLqqVaJ/wu
	eEQJNTXPQuCeV+qY7lUDPx1bQjZwU+EFAHSnTg8MChcd/ErvejYnlH+pUf7Er7xyy6PJMl48ZuwiL
	l/fFYBlHTGA+1akfwqfTxM7N76m5zNrBnqKSiUWXkSnHLgowkYEaTU4cfYhwqf1dT/TOWNjN6JL13
	ZfAsBmuACFwWneGPq2TprL84qn6j3EFrYoG5aqSVKfGsFIdtL78KKziRIOKfBfdeLxNiLoJww27ZB
	Qxla31v1w2PICycnDRbUFemkR0oux8pTDqErhMW1kcZ5ARhIDDeVSfIYqsJUg+xM8eyra+MCRE9z6
	CgPsxQO3ZLtcHnNugf/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRHX0-00146C-QP; Mon, 07 Mar 2022 17:52:26 +0000
Received: from mail-pj1-f50.google.com ([209.85.216.50])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRHWy-00145G-G1
 for linux-mediatek@lists.infradead.org; Mon, 07 Mar 2022 17:52:25 +0000
Received: by mail-pj1-f50.google.com with SMTP id
 p3-20020a17090a680300b001bbfb9d760eso17499790pjj.2
 for <linux-mediatek@lists.infradead.org>; Mon, 07 Mar 2022 09:52:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DwprjYwNE5LcdqrWbAc8Ni1ALn/1vHszc3TMMAI/bKY=;
 b=eP14lB6ne8ZL9USU3M6UHIPi943ZXMzWYajZZuQj/opnWpI/HafcRVy3uAeFHvGTuA
 GDMyXGOMIuDolYGvl05rNIwQI6pn8ajVL7MJkQeEV/KTz+pgW3v2l574zsJuHl2x9q+Z
 t+1wKoQ9vNTz/e8llq1oBWrfYJhXkHvCgur85FUnIZQqHF3N8Y0/AEFxVntt9FPCPKgp
 uvfOwfXDYgxlHyPnu0lLdJJM+XwDX2FJ7oCm/lrH2f4R09fXIaIvg8OM6s9OFRTnRpeZ
 f13cARBFmoW91wXQXK3ejweK+pkeUNScJ4NWPN9TNmcs7NU6SswHumdI7/5SfhcZPLQx
 s1sA==
X-Gm-Message-State: AOAM530YaxJBu/ee+1vLHYRF8LlxZMGKJy6YUmMT1r1pa79irKHXcS1V
 OjgeKTnUAZkqk2AssXv6a88=
X-Google-Smtp-Source: ABdhPJy7/vQEF/R2zXFSBVgPpq7S1lU/2A3Z2FmPOFHEXpsOmmhHUuvouFaAa0cHtZ/rNQQEq36uuQ==
X-Received: by 2002:a17:902:b210:b0:14f:d0ff:46bb with SMTP id
 t16-20020a170902b21000b0014fd0ff46bbmr13174842plr.47.1646675542435; 
 Mon, 07 Mar 2022 09:52:22 -0800 (PST)
Received: from ?IPV6:2601:647:4000:d7:feaa:14ff:fe9d:6dbd?
 ([2601:647:4000:d7:feaa:14ff:fe9d:6dbd])
 by smtp.gmail.com with ESMTPSA id
 k20-20020a056a00135400b004ecc81067b8sm17889091pfu.144.2022.03.07.09.52.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 09:52:22 -0800 (PST)
Message-ID: <19ad4174-0435-85b2-0762-1fae5e0b5f9e@acm.org>
Date: Mon, 7 Mar 2022 09:52:20 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v1] scsi: ufs: scsi_get_lba error fix by check cmd opcode
Content-Language: en-US
To: peter.wang@mediatek.com, stanley.chu@mediatek.com,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com, avri.altman@wdc.com,
 alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com, mikebi@micron.com,
 beanhuo@micron.com
References: <20220307111752.10465-1-peter.wang@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20220307111752.10465-1-peter.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_095224_560670_2CDBD98F 
X-CRM114-Status: UNSURE (   8.65  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gMy83LzIyIDAzOjE3LCBwZXRlci53YW5nQG1lZGlhdGVrLmNvbSB3cm90ZToKPiBXaGVuIHVm
cyBpbml0IHdpdGhvdXQgc2NtZC0+ZGV2aWNlLT5zZWN0b3Jfc2l6ZSBzZXQsCj4gc2NzaV9nZXRf
bGJhIHdpbGwgZ2V0IGEgd3Jvbmcgc2hpZnQgbnVtYmVyIGFuZCB1YnNhbiBlcnJvci4KPiBzaGlm
dCBleHBvbmVudCA0Mjk0OTY3Mjg2IGlzIHRvbyBsYXJnZSBmb3IgNjQtYml0IHR5cGUKPiAnc2Vj
dG9yX3QnIChha2EgJ3Vuc2lnbmVkIGxvbmcgbG9uZycpCj4gQ2FsbCBzY3NpX2dldF9sYmEgb25s
eSB3aGVuIG9wY29kZSBpcyBSRUFEXzEwL1dSSVRFXzEwL1VOTUFQLgoKSG1tIC4uLiBob3cgY2Fu
IGl0IGhhcHBlbiB0aGF0IHNlY3Rvcl9zaXplIGhhcyBub3QgYmVlbiBzZXQ/IEkgdGhpbmsgCnRo
YXQgY2FuIG9ubHkgaGFwcGVuIGZvciBMVU5zIG9mIHR5cGUgU0NTSSBESVNLIGlmIHNkX3JlYWRf
Y2FwYWNpdHkoKSAKZmFpbHM/IElmIHNkX3JlYWRfY2FwYWNpdHkoKSBmYWlscyBJIHRoaW5rIHRo
ZSBzZCBkcml2ZXIgaXMgZXhwZWN0ZWQgdG8gCnNldCB0aGUgY2FwYWNpdHkgdG8gemVybz8KCnJx
LT5fX3NlY3RvciA9PSAtMSBmb3IgZmx1c2ggcmVxdWVzdHMgYW5kIHRoZSB0eXBlIG9mIHRoYXQg
bWVtYmVyIAooc2VjdG9yX3QpIGlzIHVuc2lnbmVkLiBJIHRoaW5rIHRoYXQgaXQgaXMgYWxsb3dl
ZCBmb3IgYSBzaGlmdCBsZWZ0IG9mIAphbiB1bnNpZ25lZCB0eXBlIHRvIG92ZXJmbG93LiBGcm9t
IHRoZSBDIHN0YW5kYXJkOiAiVGhlIHJlc3VsdCBvZiBFMSA8PCAKRTIgaXMgRTEgbGVmdC1zaGlm
dGVkIEUyIGJpdCBwb3NpdGlvbnM7IHZhY2F0ZWQgYml0cyBhcmUgZmlsbGVkIHdpdGgKemVyb3Mu
IElmIEUxIGhhcyBhbiB1bnNpZ25lZCB0eXBlLCB0aGUgdmFsdWUgb2YgdGhlIHJlc3VsdCBpcyBF
MSDDlyAyRTIgLCAKcmVkdWNlZCBtb2R1bG8gb25lIG1vcmUgdGhhbiB0aGUgbWF4aW11bSB2YWx1
ZSByZXByZXNlbnRhYmxlIGluIHRoZSAKcmVzdWx0IHR5cGUuIgoKVGhhbmtzLAoKQmFydC4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlh
dGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
