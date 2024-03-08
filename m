Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 152FDC54E4A
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Mar 2024 13:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:References:
	In-Reply-To:Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mblih+4aRiBhJNw99bnE5slZmsY2YvDP13y7ErXtuoU=; b=ppW1oikIG/+M0Ro0iTaQgaB4xZ
	Rrws5JgSIL+gU61Lui7ZzozN5krQhLyUuuxmkhPyrvM8WfQsDSQeswQAytWevh6aaUzUKesdY7iNP
	YsqF0qRvil4R8UNqonOG0SP2On4cWN2JijdK8fxKf78ifAAW2M4y3Tdcjlw/42PK+s+RjIy0blej1
	FtmJ6B8zLjcRJrGuxkjNSzZKfQj8KDdTfdNZwqv7RdsQZxL21zVCAg2fCgZdh72BFqly9KbrmSLWS
	q4rlZgtxiVmJgLdPTIzXZCek1DuqaCaBh93pwp7JugrEjpP9x63m8tVrq85Ntrr/3zRvMCtYJJYb0
	eOpFHGug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riajN-00000009PX5-2nvj;
	Fri, 08 Mar 2024 13:57:49 +0000
Received: from outgoing1.flk.host-h.net ([188.40.0.86])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riajL-00000009PV0-0rQW;
	Fri, 08 Mar 2024 13:57:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=risingedge.co.za; s=xneelo; h=Message-ID:References:In-Reply-To:Subject:Cc:
	To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:reply-to:
	sender:bcc; bh=mblih+4aRiBhJNw99bnE5slZmsY2YvDP13y7ErXtuoU=; b=SRSXzERuTXXSsb
	AeuUkB8vc5rker87kqmefLj1SruVVlLnyP6JkTWSTxKuSTO3KZYsGzcajBzNFJQDxoEzmLk/B3bnA
	OhwjnPDupK2CM/bPj7zTUgmoTQbcxTiJDiurAhN7LkiN8WTqKrXWiPEeRqgzBhDvtV0JkPt28jjw2
	YWOftRtv0QRvsb04zWpyJMi3dspNYb3quHySberinV3A5dJmdXdqeTqBro7gsRfCl5Q2iTCSsWDjw
	LL6vnAIbsWlZDIgpfpE/1Qh+qK7nCNEMeFx0V/ib+IFHRmoZORfs2Xij037RfoslogfMCCiLrIZFW
	k3Ebe8K9o5dEJXSbauKg==;
Received: from www31.flk1.host-h.net ([188.40.1.173])
	by antispam3-flk1.host-h.net with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <justin.swartz@risingedge.co.za>)
	id 1riajH-0054fZ-My; Fri, 08 Mar 2024 15:57:45 +0200
Received: from roundcubeweb1.flk1.host-h.net ([138.201.244.33] helo=webmail9.konsoleh.co.za)
	by www31.flk1.host-h.net with esmtpa (Exim 4.92)
	(envelope-from <justin.swartz@risingedge.co.za>)
	id 1riajH-0007lj-3t; Fri, 08 Mar 2024 15:57:43 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Fri, 08 Mar 2024 15:57:42 +0200
From: Justin Swartz <justin.swartz@risingedge.co.za>
To: =?UTF-8?Q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, linux-mips@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] mips: dts: ralink: mt7621: add cell count properties
 to usb
In-Reply-To: <7e9221ae-e53b-475f-9b6f-4cab58b2d109@arinc9.com>
References: <0001-mips-dts-ralink-mt7621-add-cell-count-properties-to-.patch>
 <20240307223756.31643-1-justin.swartz@risingedge.co.za>
 <c445fd12-f8a8-41df-bee8-8b126b26110b@arinc9.com>
 <067071a9d57ffb09f437718cf905b121@risingedge.co.za>
 <7e9221ae-e53b-475f-9b6f-4cab58b2d109@arinc9.com>
Message-ID: <59b0b2084ea1322c3db2bfe9f2c2c702@risingedge.co.za>
X-Sender: justin.swartz@risingedge.co.za
User-Agent: Roundcube Webmail/1.3.17
X-Authenticated-Sender: justin.swartz@risingedge.co.za
X-Virus-Scanned: Clear
X-Originating-IP: 188.40.1.173
X-SpamExperts-Domain: risingedge.co.za
X-SpamExperts-Username: 
Authentication-Results: host-h.net; auth=pass (login) smtp.auth=@risingedge.co.za
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.02)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT91LYmA7WyhHcEQsf7WsZ3VPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5wCPRB8bAzJcv2cv+UqiTTc2+CpNcmBnO4XM3Sck4bwNogU
 WCl1nkLBzZX0KuJ9bXiS85Z42w/+2OBolTNFbPomXFWCX8oNdggW7HE9XDTdSejrkEpbuUvwMvHx
 3T+KSG//gbuP7hnUK8NQdLwsVWKIFDZRrTGv3rxiw9tFrqFSCFNiLZt/QXQnOBRD+jq1HsKsDh/6
 Srgk2K3gr1VBfJbChkYH6fbrypLNrde+UooQVNLReLErukdelEOHUIpaBbp5GdnsN8+UvimwMinK
 0+Txhz2u9qvrL2PODYgMZQApJXOjDLkqunZ9NcY2bHZn7CfFscMZZf3sCkN20I5vMh4akiObI7Kj
 vK7X04QEin24qbfMFd8eGjnYW8aSH5qj4ujh/13psIvqSqJFa1CcANErDW/w69saM9prk3jNnHtn
 nuEt/J9wDZeQfiNOYsLDFBdwYt2XtlLzy7G7T4kla0JNnAWQx3FS11bhwUa9HCIwKB+TroNcRY33
 oNmH4nRQzHQazgY7lmveanvOdQzf6IMJ3345q/s6ySNrGnXycmhg3FDRRzisL1oin/zKhywqX9/w
 bOl0qtP5EgfDRdSDhnwOLtBcNrQxKZYuPe8bdCyw79zlPbqLQkZr26Lcxdvj8cqI+CogZdOhX7v3
 ClXzrmMENhJLl6MBfhzHVBR0wHQZxzIUka7Uq615Mik1qzcz30+tdk6yIuh9K7v+Nq0Cm3JVhle6
 F/kpBdN+oWjoATjEFDwcaiz0R34rhTN+GTbl4uS+pZovX9cex7Ac4fawcerGI7TrGXpM/B/M0BZd
 PfIU1BX7pZc1sE3vsz58auH/srM2fgZ9JmgLbj7sqoEiwv7LCxIiAE5ODMnmwjvj2589zjbyZCiM
 WpBpW8YvoIIqmZcWhL/r/eFjMjJnMHeiAPOVAT1rE1/vP68Bb4z3v3h3gCdXrv2+9GnNX30LKqXb
 fwFKgm/rnYBl+Mj5KqOl6Jzub/f3QhLRbOgisvi5VU9eNBtgo6zjiatjNO/pnMCjuIvXs/AyV/Ns
 URB/R+FlEHyAzksgfaRvdgw0WK34QWnzHHMcN6qoXPjenLhIOF1oeRYbjF1Hp647mOWoQlc3hL3c
 dBMSQgQtiTUcJp5roVy0aSDnJVDNCxo62e2RFzS2kkd4u/m4iBmYb1/LCV4/EuVHup06w3Vwxf9C
 F7D6LKKRTfdjzQ6YC7Heg3Xf7O1TOd6RcY/MXB8eEq3bCN2QohZvyS03iBmgsz450Kmjd3fGV5Pc
 rZPg14lcNaSs4Fwukty8QMQa7L0bD+vL0NiZJ28dIbtf63VNbf0lrvssY+k7AHGi1NevGWTo2+h8
 Lhk4HCeZR7ymlGVRtthBJ2y8A5arx6JItKpFaUNPGMMlvbMX0nyK1NiAJ0y2Qvvn6ds6mor35w4f
 SfHzQbABJfgy21HclcZkPRq7NhoxyMwqi8Q23Rgadfh5T5n5D4OHHpbEIgsllZKWnzc5M5WlNtVJ
 qo05MS+4ayUpOtEhdxekWDmK9g==
X-Report-Abuse-To: spam@antispamquarantine.host-h.net
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_055747_336967_1129EE99 
X-CRM114-Status: GOOD (  21.26  )
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

On 2024-03-08 15:48, Arınç ÜNAL wrote:
> On 8.03.2024 16:21, Justin Swartz wrote:
>> 
>> On 2024-03-08 14:01, Arınç ÜNAL wrote:
>>> On 8.03.2024 01:37, Justin Swartz wrote:
>>>> Add default #address-cells and #size-cells properties to the
>>>> usb node, which should be suitable for hubs and devices without
>>>> explicitly declared interface nodes, as:
>>>> 
>>>>    "#address-cells":
>>>>      description: should be 1 for hub nodes with device nodes,
>>>>        should be 2 for device nodes with interface nodes.
>>>>      enum: [1, 2]
>>>> 
>>>>    "#size-cells":
>>>>      const: 0
>>>> 
>>>> -- Documentation/devicetree/bindings/usb/usb-device.yaml
>>>> 
>>>> This version of the patch places the properties according to
>>>> the order recommended by:
>>>> 
>>>>     Documentation/devicetree/bindings/dts-coding-style.rst
>>>> 
>>>> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>
>>>> ---
>>>>   arch/mips/boot/dts/ralink/mt7621.dtsi | 4 ++--
>>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>> 
>>>> diff --git a/arch/mips/boot/dts/ralink/mt7621.dtsi 
>>>> b/arch/mips/boot/dts/ralink/mt7621.dtsi
>>>> index 5a89f0b8c..7532e17dd 100644
>>>> --- a/arch/mips/boot/dts/ralink/mt7621.dtsi
>>>> +++ b/arch/mips/boot/dts/ralink/mt7621.dtsi
>>>> @@ -289,10 +289,10 @@ usb: usb@1e1c0000 {
>>>>           reg = <0x1e1c0000 0x1000
>>>>                  0x1e1d0700 0x0100>;
>>>>           reg-names = "mac", "ippc";
>>>> -
>>>> +        #address-cells = <1>;
>>>> +        #size-cells = <0>;
>>>>           clocks = <&sysc MT7621_CLK_XTAL>;
>>>>           clock-names = "sys_ck";
>>>> -
>>> 
>>> Please keep the empty lines. It's easier to read. I don't see 
>>> anything on
>>> the Devicetree Sources (DTS) Coding Style that would restrict this.
>> 
>> The reason I removed them was due to the SoC DTSI example shown in [1]
>> lacking empty lines between properties, but then using them instead as
>> visual separation between properties and child nodes, or at least 
>> that's
>> how I understood it when I looked at it.
>> 
>> Personally, I prefer the look of the SoC DTSI example - but I don't 
>> mind
>> recreating the patch set with the empty lines between the properties 
>> left
>> entact.
>> 
>> As there is a mix of property spacing and ordering styles in 
>> mt7621.dtsi
>> already - what is the consensus on what a node in this file should 
>> look
>> like?
> 
> There's no precise spacing style I maintain here. I simply group 
> together
> properties that describe a single attribute, and separate those that
> describe different attributes.

I'll recreate v3 accordingly.


>> I also don't mind following that pattern and cleaning up the whole 
>> dtsi
>> according to that if it'll save us all time and energy in future.
> 
> If you'd like to improve the ordering style of the MT7621 device tree
> sources accordingly with
> Documentation/devicetree/bindings/dts-coding-style.rst, I'd be happy to
> review those patches.

Thanks, I'll make an attempt at this sometime soon.


Regards
Justin

