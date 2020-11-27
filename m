Return-Path: <SRS0=3jAl=FB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BDA6C63777
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 09:19:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A10F20809
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 09:19:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PIERlZnb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PJ5t0QkE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A10F20809
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IMAY8lPNBd4o1CtkeOOCoD8t3pe1m84lo+fhvJ78us8=; b=PIERlZnbtze0n6troGG04dDpS
	lITA9fiLdAWOce/WbeBTDcljsk/1GGGskpLFWGI5s7guS9BaXJj7dLEohjyOYbe6QCjIszxcLPLng
	Qk4oKsMplq6KCCzfAiOgzNEw/gFLMsikrjFkFClxBh4SyPfgkkf7oT2p3H+Mfnv/l4+zbVsOepQfu
	tK3SlZ21ZG/Ea7iMh21MwOiklI6ZY8Zv2legIhxGvplu0PT9hp2K/F82JiCyN43B1VWxYkIQAqOuC
	0z3bHTtFGq+wuC015Fp9TLH+iRob91Rh5AiG9tYWC+qAw/ckdwG4nTsmVJw/MXrshLTsV3NCLn+Ai
	6NpfT0QAg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiZuO-0001E2-2Z; Fri, 27 Nov 2020 09:19:16 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiZuI-00015R-EL
 for linux-mediatek@lists.infradead.org; Fri, 27 Nov 2020 09:19:12 +0000
Received: by mail-wr1-x441.google.com with SMTP id t4so4776430wrr.12
 for <linux-mediatek@lists.infradead.org>; Fri, 27 Nov 2020 01:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=A26ZMmYnqkQXeQq0wV1chPfAYo0PqBfot7Ttx2A33j0=;
 b=PJ5t0QkEUJ6HGtDPjdNn6QEUcJKqNE1o/s0FcKd6DRVzCfLUZCaZlrwZP5UJp6No3g
 zyk/3ySomDjKyXMbfAsPykWcIm+BJweQaTAWxw33FVJvGhqcNM/3tm0qyPkv8Q9BwDtu
 Kl9LhaA1f9QeaZ0tlYpLqsRRmnDLpXEe8f8rL8lAVTrCHFSpO8U9iTeQuQc6IKgInHDE
 BgyvMySrV4qIZjxd6Z5Qt3nfR5oEzqBNjZTbqugiogNtXH3mEtntDwolgaPAAFAYHak4
 owpyQrkYv+g3vpSB+eeVrrWjWt/Gd3eARpiXtgRsQXtB4EQm7lTymi1slaedDr1fKkR0
 urEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=A26ZMmYnqkQXeQq0wV1chPfAYo0PqBfot7Ttx2A33j0=;
 b=itQ3oKWbpj8L1BFimQJ4BSfUAYuFzCa1sA6SAcn2YjDokoH9qzIO9597qB5nvHb16I
 /cFoOOjRVcYJgSN+d+pKGrXQkAHzsoK1IjR6Im3pgk3FFj4hS2MOFlxmXDhWwFwrlMSm
 H9nWhLqs/gfHxsp0j8hiYD+MJ50UcqsdiYaSrYsbRYi3O7BOEFQf4b5EVCxAb6j1reaF
 TjSZtdwKEdPuBYhC4ftevkgyLYfnsGFEZmlGhTmWCJwsALvb5X226HUJDIWmWHSMI2G/
 DxQ4MKndgp3tWfvm+DcuXTJVrEzexhNTK0n2DnHWXY/F3LEJb7Fq6Ma4eN/rrqwqn/0t
 FPGA==
X-Gm-Message-State: AOAM531GR1l47l/dKHhwTMwmV6zrQh3IFCkDjXfWWvHN3rwozkuFE2lt
 evvIUQVaKBx95T43Gkv9cpLIbA==
X-Google-Smtp-Source: ABdhPJyNkVvornnZnvqN1e7jEL7pv2co1g2LAVA5Q9nUQ5XYB9S3q5i2Ix85OBANIDvIOoAzw3mnYQ==
X-Received: by 2002:a5d:5183:: with SMTP id k3mr9544586wrv.62.1606468746292;
 Fri, 27 Nov 2020 01:19:06 -0800 (PST)
Received: from dell ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id y130sm2445113wmc.22.2020.11.27.01.19.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 01:19:05 -0800 (PST)
Date: Fri, 27 Nov 2020 09:19:03 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH v3 7/8] regulator: mt6359: Add support for MT6359P
 regulator
Message-ID: <20201127091903.GN2455276@dell>
References: <1606103290-15034-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1606103290-15034-8-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1606103290-15034-8-git-send-email-hsin-hsiung.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_041910_731539_69B08202 
X-CRM114-Status: GOOD (  12.98  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAyMyBOb3YgMjAyMCwgSHNpbi1Ic2l1bmcgV2FuZyB3cm90ZToKCj4gVGhlIE1UNjM1
OVAgaXMgYSBlY28gdmVyc2lvbiBmb3IgTVQ2MzU5IHJlZ3VsYXRvci4KPiBXZSBhZGQgc3VwcG9y
dCBiYXNlZCBvbiBNVDYzNTkgcmVndWxhdG9yIGRyaXZlci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBI
c2luLUhzaXVuZyBXYW5nIDxoc2luLWhzaXVuZy53YW5nQG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAg
ZHJpdmVycy9yZWd1bGF0b3IvbXQ2MzU5LXJlZ3VsYXRvci5jICAgICAgIHwgNDEzICsrKysrKysr
KysrKysrKysrKysrLQo+ICBpbmNsdWRlL2xpbnV4L21mZC9tdDYzNTlwL3JlZ2lzdGVycy5oICAg
ICAgfCAyNDkgKysrKysrKysrKysrKwo+ICBpbmNsdWRlL2xpbnV4L3JlZ3VsYXRvci9tdDYzNTkt
cmVndWxhdG9yLmggfCAgIDEgKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDY1OCBpbnNlcnRpb25zKCsp
LCA1IGRlbGV0aW9ucygtKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC9tZmQv
bXQ2MzU5cC9yZWdpc3RlcnMuaAoKRm9yIG15IG93biByZWZlcmVuY2UgKGFwcGx5IHRoaXMgYXMt
aXMgdG8geW91ciBzaWduLW9mZiBibG9jayk6CgogIEFja2VkLWZvci1NRkQtYnk6IExlZSBKb25l
cyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+CgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNlbmlv
ciBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVu
IHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBU
d2l0dGVyIHwgQmxvZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tZWRpYXRlawo=
