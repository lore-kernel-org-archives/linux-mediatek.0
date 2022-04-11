Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC86CC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 07:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=68roncnbL3qddrg/5bXOUP705uZ4xvg4iFqDbz888Rs=; b=TGNe06RkZXAMQt
	XpywcQlGeVOC4XKqCcmQZdqMnc0JuLNBdY9SsSnHy77kB40IIIPjq/ZKMqoFBAHWu4E3GNCm3UG8w
	4gYOzmjhtvipfFATBpqzVNgiKCFaxl96QOU96VxysUap5yDT446eKpQ0OfsLVOs7I5EUzuc34uJfp
	obS6AEOidIYnx7MhVRMGuyDD3AjJPaEdJ8xk+Bq0+f6jjOl25AvUH9vOhs7zoFlDovuhdtcqIjSmM
	xUMdCUP47Z2YbiZU+4xU0jZylYgh2AIS8dwfiMoSLvNTYgHPSJdV407qpv8WM4qQfQL+0+CFuKSiu
	0ny8XXzGc6SMB0k6DhXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndoKb-0079k8-0j; Mon, 11 Apr 2022 07:19:25 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndoKP-0079ei-8y; Mon, 11 Apr 2022 07:19:14 +0000
Received: by mail-qt1-x831.google.com with SMTP id j21so15717245qta.0;
 Mon, 11 Apr 2022 00:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uvgV1BY+rIPRMf+tZuNXq+JhBBxIhG+vco4o8o6aSBw=;
 b=mWOtVNkFDzMdiNlXsUeyEC2ncDj4Ap7ulhZdoJRfh3ABVy6LbMdz2sEJLbKkWnS48l
 oauHFy/UxsrKpQk4vd6soiizLr14hjnR+ApN1mmQST0tOFNi8+0Kx435q30Y4KBEkizT
 LWfvSG0/Qq537aV9QFOSz5A+LjuimqF1Hu95cCB/B9y6Xad2KNXnsrJBci6FRQqhXhWt
 2Qj1Y9PK+PVOidciSGQlIeuNDF09dvUi1yBWB3L106+13u3I3rAzNcX0qF9ewme1Pepe
 9/MYacEHNNXoe03+vMPWENFdOz6lIEx03hITkzOeYfM/O+bNrZRwCqDV5MWvV3hDoW3G
 J28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uvgV1BY+rIPRMf+tZuNXq+JhBBxIhG+vco4o8o6aSBw=;
 b=ZMX+w9pBS5LD9KWv9hHeEPeRAp09tZrDKplgfOGZzKzrEUfM0BfLty4KuAyw0lMZo3
 0hxMs3rF8FsYCEouIMgi9ibYCie3cINSZSUiggx81M1YNSf69060wPricVuEqyVKeeQq
 9TIioQQoc5kKN1uHofaV1WtfkevDza9FTkwerT9tRLIVUaX+hSFEIeViU3z8UGmef5aW
 Qdml2Oe+3fz+Xf39hyujYjnHjWnCGy39a9J9PHWWxRffy3sXZPp84dVGil046de3YpNn
 8ylGsqASetU6nMgsPCuASe5yIXDwNTrEAMAHFeXZbXUQ9CzCNeura1iBrRyuAtUz3QnU
 HnWw==
X-Gm-Message-State: AOAM530UlE8EujVIpAXqW/5Lx7IWYOQT2aIZq310RFrjL0C5G6ZynnZb
 8ZeHvT73eLaEJxq5bjWu1AvMmOjaXFhD9wnXQP8=
X-Google-Smtp-Source: ABdhPJySdwKqOUwuJc4UxhKp3iYsvAFTJ6rHdh1IeEv+ZV+V9wOJqdT5lSwvct1LEYKzySv1xmuLv5MNkexC7ELCjgY=
X-Received: by 2002:ac8:7c46:0:b0:2e1:d6c2:2b15 with SMTP id
 o6-20020ac87c46000000b002e1d6c22b15mr24649120qtv.405.1649661551017; Mon, 11
 Apr 2022 00:19:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220410203138.22513-1-arinc.unal@arinc9.com>
In-Reply-To: <20220410203138.22513-1-arinc.unal@arinc9.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Mon, 11 Apr 2022 09:19:00 +0200
Message-ID: <CAMhs-H8kho3wySRzkdnauJwcscUVLjcnQiKbOOw52amxmWtH0A@mail.gmail.com>
Subject: Re: [PATCH 1/3] mips: dts: mt7621: add mdio label to mdio-bus
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 "open list:MIPS" <linux-mips@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_001913_369194_BE0D24EE 
X-CRM114-Status: GOOD (  11.05  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gU3VuLCBBcHIgMTAsIDIwMjIgYXQgMTA6MzIgUE0gQXLEsW7DpyDDnE5BTCA8YXJpbmMudW5h
bEBhcmluYzkuY29tPiB3cm90ZToKPgo+IEFkZCBtZGlvIGxhYmVsIHRvIHRoZSBtZGlvLWJ1cyBu
b2RlIHRvIGVhc2lseSByZWZlciB0byBpdC4KPgo+IFVzZSB0aGUgbmV3bHkgY3JlYXRlZCBsYWJl
bCBvbiB0aGUgR0ItUEMyIGRldmljZXRyZWUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBcsSxbsOnIMOc
TkFMIDxhcmluYy51bmFsQGFyaW5jOS5jb20+Cj4gLS0tCj4gIC4uLi9ib290L2R0cy9yYWxpbmsv
bXQ3NjIxLWdudWJlZS1nYi1wYzIuZHRzICAgfCAxOCArKysrKysrKy0tLS0tLS0tLS0KPiAgYXJj
aC9taXBzL2Jvb3QvZHRzL3JhbGluay9tdDc2MjEuZHRzaSAgICAgICAgICB8ICAyICstCj4gIDIg
ZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKClJldmlld2Vk
LWJ5OiBTZXJnaW8gUGFyYWN1ZWxsb3MgPHNlcmdpby5wYXJhY3VlbGxvc0BnbWFpbC5jb20+CgpU
aGFua3MsCiAgICBTZXJnaW8gUGFyYWN1ZWxsb3MKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1t
ZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
