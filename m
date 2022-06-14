Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA47C43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jun 2022 18:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wQWCj7wbUpJmoiWPkT5AM41YoG6A5W6kmmMXFuuvaiY=; b=15q44Cug1h252q
	khiZbYH5ipnM30m7208dFDqsdTxrHghdQn254sHFvT+f0ZFgOQAMZ1vzjSEyHKW2TQhzosJcQrgex
	Yq5ATznLZTd9kCOCC0HtgtDBwnpQ7Bhyk51Zc2oPQw3wFl2OPWx95frvGKPHwj9MaZQDQlYbDMZgx
	tPNKo7FmN58MB0uEBkNDeKT92XshxCiOx1ylZ8k41PkQVc7DTbvQeLZ6MBuU+bz/ml4Pa6DeH/fv2
	h/mMgZi+7UoHlvHC72siBTMq6TFLcsZkVuw4fpBbZgKHgb+kmAMIEaYYmaqSkCY5BhggXb+SoUlyL
	R7puyFVFA2YIrjF0anvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1B5I-00AjZM-1F; Tue, 14 Jun 2022 18:16:12 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1B5C-00AjXD-48
	for linux-mediatek@lists.infradead.org; Tue, 14 Jun 2022 18:16:10 +0000
Received: by mail-qk1-x732.google.com with SMTP id 15so7004653qki.6
        for <linux-mediatek@lists.infradead.org>; Tue, 14 Jun 2022 11:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=IUZbp7PiXUU7CAVpO1jooUP9RPiupsus4DCsHt1x4pQ=;
        b=GVcOu+R24+27b2NOvitiVm0BFB8m/d5jTlFrMXfoUi7v9rt8nF0E2q0h9wUTAiiNqL
         0dOB9sUXKyM0KWkVvc1bLRbT+961TQS0GbEGUMR0YGhhtAnUHWh7SgKaU8H5D/WOw8Ik
         kQVot4N1MIEvbRmr+TER8hR+dyhNLMzo/wAy4KqSibgLRZ12kyTdDUvVynQ+q9Et3sXJ
         KYwRZ3CWARS/lM6FUYw1ZReTAYgotqGiLV5I9b1DU9WZmol83vnmF7+66YxUiG3p7AJh
         UyIActoNb1Aa6Nk+ElpIqwIJ+vtaj0p4ApTGcXhfvGgGcu7l/oIrN6JB9zdXPQFK0N2E
         AtDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=IUZbp7PiXUU7CAVpO1jooUP9RPiupsus4DCsHt1x4pQ=;
        b=Utx49r3PTU23IGdpIuCh0aSFnTh/fQat4QpBR1yIUs78kRuFSKzTxnLAVlafHeLhN6
         woK/MNOYsvbd2J0P1wWx4HYTULSb7QadVPl5qVN0aTCWISeehP2Wdhg9gMYOjxfdy4ia
         RloXENLpjcpsTxdZ57UdyOIToacF+wEmxbAi4XkXPR9T/cwv/s+U/3q8bHbLriGYYz5E
         RKJkVv8lmTr+QS1dykj3UaaHJLqjZ2nWpBJgtkJSw71hruMVvcLvr8K15vNAS10KdA35
         r6yZRPAg8eaBvR2UAZFSe9UB5PsvOFTJJxRJAfV6kl1z+bBvzGn2nCb6+HRZsXXAe4Br
         UaFw==
X-Gm-Message-State: AOAM533BX+qiPO+GO+K0AJuofMI7vTMLG9b1STdexmc2XUpPymJTmtgs
	iaIScLptWNuNPVefZ2uM6zPPPA==
X-Google-Smtp-Source: ABdhPJyspk1OooBvKaZDZNbDRmfj2xD5SU/mh9sKS0Jw8BTrNURhDW6qUdVc4ix3LNjCyOrp5xwfbA==
X-Received: by 2002:a05:620a:28d6:b0:6a7:7a8d:4840 with SMTP id l22-20020a05620a28d600b006a77a8d4840mr4912308qkp.500.1655230563578;
        Tue, 14 Jun 2022 11:16:03 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net. [192.222.136.102])
        by smtp.gmail.com with ESMTPSA id r11-20020a37a80b000000b006a6ab259261sm9371251qke.29.2022.06.14.11.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 11:16:03 -0700 (PDT)
Message-ID: <9fef91917df081bd94e4b8e7e76b441264ad073c.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mediatek: vcodec: fix minmax.cocci warning
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Guo Zhengkui <guozhengkui@vivo.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>,  Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Yunfei
 Dong <yunfei.dong@mediatek.com>, Haowen Bai <baihaowen@meizu.com>, George
 Sun <george.sun@mediatek.com>, "open list:MEDIA INPUT INFRASTRUCTURE
 (V4L/DVB)" <linux-media@vger.kernel.org>, open list
 <linux-kernel@vger.kernel.org>,  "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
Cc: zhengkui_guo@outlook.com
Date: Tue, 14 Jun 2022 14:16:01 -0400
In-Reply-To: <20220614072618.26925-1-guozhengkui@vivo.com>
References: <20220614072618.26925-1-guozhengkui@vivo.com>
User-Agent: Evolution 3.44.1 (3.44.1-1.fc36) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_111606_233049_E63CB98C 
X-CRM114-Status: GOOD (  12.87  )
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

TGUgbWFyZGkgMTQganVpbiAyMDIyIMOgIDE1OjI1ICswODAwLCBHdW8gWmhlbmdrdWkgYSDDqWNy
aXTCoDoKPiBGaXggdGhlIGZvbGxvd2luZyBjb2NjaWNoZWNrIHdhcm5pbmc6Cj4gCj4gZHJpdmVy
cy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay92Y29kZWMvdmRlYy92ZGVjX3ZwOV9yZXFfbGF0X2lm
LmM6Cj4gNjk0OjE1LTE2OiBXQVJOSU5HIG9wcG9ydHVuaXR5IGZvciBtaW4oKS4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBHdW8gWmhlbmdrdWkgPGd1b3poZW5na3VpQHZpdm8uY29tPgoKUmV2aWV3ZWQt
Ynk6IE5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAY29sbGFib3JhLmNvbT4KCj4g
LS0tCj4gIC4uLi9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay92Y29kZWMvdmRlYy92ZGVjX3ZwOV9y
ZXFfbGF0X2lmLmMgICB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVk
aWF0ZWsvdmNvZGVjL3ZkZWMvdmRlY192cDlfcmVxX2xhdF9pZi5jIGIvZHJpdmVycy9tZWRpYS9w
bGF0Zm9ybS9tZWRpYXRlay92Y29kZWMvdmRlYy92ZGVjX3ZwOV9yZXFfbGF0X2lmLmMKPiBpbmRl
eCBmNDY0YWYxOTBkOGMuLjgxZGU4NzZkNTEyNiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL21lZGlh
L3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy92ZGVjL3ZkZWNfdnA5X3JlcV9sYXRfaWYuYwo+ICsr
KyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL3ZkZWMvdmRlY192cDlf
cmVxX2xhdF9pZi5jCj4gQEAgLTY5MSw3ICs2OTEsNyBAQCBzdGF0aWMgaW50IHZkZWNfdnA5X3Ns
aWNlX3RpbGVfb2Zmc2V0KGludCBpZHgsIGludCBtaV9udW0sIGludCB0aWxlX2xvZzIpCj4gIAlp
bnQgc2JzID0gKG1pX251bSArIDcpID4+IDM7Cj4gIAlpbnQgb2Zmc2V0ID0gKChpZHggKiBzYnMp
ID4+IHRpbGVfbG9nMikgPDwgMzsKPiAgCj4gLQlyZXR1cm4gb2Zmc2V0IDwgbWlfbnVtID8gb2Zm
c2V0IDogbWlfbnVtOwo+ICsJcmV0dXJuIG1pbihvZmZzZXQsIG1pX251bSk7Cj4gIH0KPiAgCj4g
IHN0YXRpYwoKcmVnYXJkcywKTmljb2xhcwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRp
YXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
